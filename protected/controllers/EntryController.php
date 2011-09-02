<?php

class EntryController extends Controller {
    const PAGE_SIZE=25;

    /**
     * @var CActiveRecord the currently loaded data model instance.
     */
    private $_model;

    /**
     * @return array action filters
     */
    public function filters() {
        return array(
            'accessControl', // perform access control for CRUD operations
        );
    }

    /**
     * Specifies the access control rules.
     * This method is used by the 'accessControl' filter.
     * @return array access control rules
     */
    public function accessRules() {
        return array(
            array('allow', // allow all users to perform 'index' and 'view' actions
                'actions' => array('index', 'view'),
                'users' => array('*'),
            ),
            array('allow', // allow authenticated user to perform 'create' and 'update' actions
                'actions' => array('create', 'update'),
                'users' => array('@'),
            ),
            array('allow', // allow admin user to perform 'admin' and 'delete' actions
                'actions' => array('admin', 'delete'),
                'users' => array('admin', 'sku', 'leehsueh'),
            ),
            array('deny', // deny all users
                'users' => array('*'),
            ),
        );
    }

    /**
     * Displays a particular model.
     */
    public function actionView() {

        $this->render('view', array(
            'model' => $this->loadModel(),
        ));
    }

    /**
     * Sets the startverse and endverse id attributes of the $model
     * according to the passage expression. Assumes $biblePassage->passage
     * is non-null.
     * @param Entry $model
     * @param EntryFilterForm $biblePassage
     * @return boolean true if passage is valid and $model attributes set, otherwise false
     */
    private function parsePassage($model, $biblePassage) {
        if ($biblePassage->validate()) {
            $bibleBook = $biblePassage->book;
            $startChapter = (int) $biblePassage->startChapter;
            $startVerse = (int) $biblePassage->startVerse;
            $endChapter = (int) $biblePassage->endChapter;
            $endVerse = (int) $biblePassage->endVerse;

            if ($startChapter && $startVerse)
                $startverse = BibleVerse::verse($bibleBook, $startChapter, $startVerse);
            else if ($startChapter)
                $startverse = BibleVerse::verse($bibleBook, $startChapter, 1);
            else
                $startverse = BibleVerse::verse($bibleBook, 1, 1);

            if ($endChapter && $endVerse)
                $endverse = BibleVerse::verse($bibleBook, $endChapter, $endVerse);
            else if ($endChapter)
                $endverse = BibleVerse::lastVerse($bibleBook, $endChapter);
            else
                $endverse = $startverse;

            $model->start_verse_id = $startverse->verse_id;
            $model->end_verse_id = $endverse->verse_id;
            return true;
            
        } else {
            return false;
        }
    }

    /**
     * Creates a new model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     */
    public function actionCreate() {
        $biblePassage = new EntryFilterForm();
        $model = new Entry;
        if (isset($_POST['Entry'])) {
            $model->attributes = $_POST['Entry'];
            $model->date_added = date('Y-m-d', time()); // autopopulated today's date

            $validPassage = false;
            if (isset($_POST['EntryFilterForm']['passage']) && $_POST['EntryFilterForm']['passage']) {
                $biblePassage->attributes = $_POST['EntryFilterForm'];
                $validPassage = $this->parsePassage($model, $biblePassage);
            } else {
                $validPassage = true;   // passage not required
            }

            if ($model->save() && $validPassage) {
                if ($_POST['Entry']['categories']) {
                    $categories = $_POST['Entry']['categories'];
                    foreach ($categories as $category_id) {
                        $entryCategoryLink = new EntryCategory();
                        $entryCategoryLink->category_id = $category_id;
                        $entryCategoryLink->entry_id = $model->entry_id;
                        $entryCategoryLink->save();
                    }
                }
                $this->redirect(array('view', 'id' => $model->entry_id));
            }
        }

        $this->render('create', array(
            'model' => $model,
            'biblePassage' => $biblePassage
        ));
    }

    /**
     * Updates a particular model.
     * If update is successful, the browser will be redirected to the 'view' page.
     */
    public function actionUpdate() {
        $model = $this->loadModel();
        $biblePassage = new EntryFilterForm();
        $biblePassage->passage = $model->getPassageReference();
        
        $categories = $model->categories;

        if (isset($_POST['Entry'])) {
            $model->attributes = $_POST['Entry'];
            
            $validPassage = false;
            if (isset($_POST['EntryFilterForm']['passage']) && $_POST['EntryFilterForm']['passage']) {
                $biblePassage->attributes = $_POST['EntryFilterForm'];
                $validPassage = $this->parsePassage($model, $biblePassage);
                
            } else {
                $validPassage = true;   // passage not required
                $biblePassage->passage = null;
                $model->start_verse_id = null;
                $model->start_verse_id = null;
            }

            if ($model->save() && $validPassage) {
                if ($_POST['Entry']['categories']) {
                    $updatedCategories = $_POST['Entry']['categories'];
                    $entryCategoryLinks = EntryCategory::model()->findAll(array('condition' => 'entry_id=' . $model->entry_id));

                    foreach ($entryCategoryLinks as $link) {
                        // delete existing link if category was unselected
                        if (array_search($link->category_id, $updatedCategories) == false)
                            $link->delete();
                    }
                    foreach ($updatedCategories as $category_id) {
                        // create new link if one doesn't exist
                        if (!EntryCategory::model()->find(array('condition' => 'entry_id=' . $model->entry_id . ' AND category_id=' . $category_id))) {
                            $entryCategoryLink = new EntryCategory();
                            $entryCategoryLink->category_id = $category_id;
                            $entryCategoryLink->entry_id = $model->entry_id;
                            $entryCategoryLink->save();
                        }
                    }
                }
                $this->redirect(array('view', 'id' => $model->entry_id));
            }
        }

        $categoryOptions = array();
        foreach ($categories as $cat) {
            $categoryId = $cat->category_id;
            $categoryOptions[(string) $categoryId] = array('selected' => '');
        }
        $this->render('update', array(
            'model' => $model,
            'biblePassage' => $biblePassage,
            'categoryOptions' => $categoryOptions,
        ));
    }

    /**
     * Deletes a particular model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     */
    public function actionDelete() {
        if (Yii::app()->request->isPostRequest) {
            // we only allow deletion via POST request
            // delete entry_category rows
            $entry_id = $this->loadModel()->entry_id;
            $entryCategoryLinks = EntryCategory::model()->findAll(array('condition' => 'entry_id=' . $entry_id));
            foreach ($entryCategoryLinks as $link) {
                $link->delete();
            }
            $this->loadModel()->delete();

            // if AJAX request (triggered by deletion via admin grid view), we should not redirect the browser
            if (!isset($_POST['ajax']))
                $this->redirect(array('index'));
        }
        else
            throw new CHttpException(400, 'Invalid request. Please do not repeat this request again.');
    }

    /**
     * Lists all models.
     */
    public function actionIndex() {
        $filterFormModel = new EntryFilterForm();

        // check for search options
        if (isset($_GET['EntryFilterForm']['passage'])) {
            $filterFormModel->attributes = $_GET['EntryFilterForm'];
            if ($filterFormModel->validate()) {
                // create a criteria to filter entries returned;
                // form rules enforce that if endChapter is specified, startChapter
                // is also specified, and that book is required. Use this assumption
                // to do the following sequential if-logic
                if ($filterFormModel->startVerse != null || $filterFormModel->endVerse != null) {
                    // get criteria that includes book, chapter, and verse range
                    $entryCriteria = Entry::entriesByVerseRangeCriteria(
                                    $filterFormModel->book,
                                    $filterFormModel->startChapter,
                                    $filterFormModel->startVerse,
                                    $filterFormModel->endChapter,
                                    $filterFormModel->endVerse
                    );
                } else if ($filterFormModel->endChapter != null) {
                    // book, startChapter, and endChapter all specified
                    $entryCriteria = Entry::entriesByChapterRangeCriteria(
                                    $filterFormModel->book,
                                    $filterFormModel->startChapter,
                                    $filterFormModel->endChapter
                    );
                } else if ($filterFormModel->startChapter != null) {
                    // only book and startChapter specified
                    $entryCriteria = Entry::entriesByChapterRangeCriteria(
                                    $filterFormModel->book,
                                    $filterFormModel->startChapter
                    );
                }
                else    // only book specified
                    $entryCriteria = Entry::entriesByBookCriteria($filterFormModel->book);
            }
        }

        $dataProvider = new CActiveDataProvider('Entry', array(
                    'pagination' => array(
                        'pageSize' => self::PAGE_SIZE,
                    ),
                ));
        if ($entryCriteria != null)
            $dataProvider->criteria = $entryCriteria;

        $dataProvider->sort->defaultOrder = 'last_updated DESC, date_added DESC, entry_id DESC';

        $this->render('index', array(
            'dataProvider' => $dataProvider,
            'filterFormModel' => $filterFormModel,
        ));
    }

    /**
     * Manages all models.
     */
    public function actionAdmin() {
        $dataProvider = new CActiveDataProvider('Entry', array(
                    'pagination' => array(
                        'pageSize' => self::PAGE_SIZE,
                    ),
                ));

        $this->render('admin', array(
            'dataProvider' => $dataProvider,
        ));
    }

    /**
     * Returns the data model based on the primary key given in the GET variable.
     * If the data model is not found, an HTTP exception will be raised.
     */
    public function loadModel() {
        if ($this->_model === null) {
            if (isset($_GET['id']))
                $this->_model = Entry::model()->findbyPk($_GET['id']);
            if ($this->_model === null)
                throw new CHttpException(404, 'The requested page does not exist.');
        }
        return $this->_model;
    }

}
