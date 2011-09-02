<?php

class Entry extends CActiveRecord {
    /**
     * The followings are the available columns in table '{{Entry}}':
     * @var integer $entry_id
     * @var integer $start_verse_id
     * @var integer $end_verse_id
     * @var integer $entry_author_id
     * @var string $heading
     * @var string $entry_text
     * @var string $start_word
     * @var integer $depth
     * @var integer $reference_id
     * @var integer $ref_start_page_num
     * @var integer $ref_end_page_num
     * @var string $date_added
     * @var string $last_updated
     */

    /**
     * Returns the static model of the specified AR class.
     * @return CActiveRecord the static model class
     */
    public static function model($className=__CLASS__) {
        return parent::model($className);
    }

    /**
     * Returns CDbCriteria for entries associated with a given book
     * @param $book, string of the Bible book, e.g. 'Genesis'
     * @return CDbCriteria for the Entry table
     */
    public static function entriesByBookCriteria($book) {
        $verse1 = BibleVerse::verse($book, 1, 1);

        // find last verse in the book
        $condition = 'book = :book';
        $params = array(':book' => $book);
        $criteria = new CDbCriteria(array(
                    'condition' => $condition,
                    'params' => $params,
                    'order' => 'verse_id DESC')
        );
        $verse2 = BibleVerse::model()->find($criteria);

        // find all entries where the start verse is between verse1 and verse2
        $condition = 'start_verse_id >= :start_verse_id AND end_verse_id <= :end_verse_id';
        $params = array(
            ':start_verse_id' => $verse1->verse_id,
            ':end_verse_id' => $verse2->verse_id
        );
        $criteria = new CDbCriteria(array(
                    'condition' => $condition,
                    'params' => $params,
                ));

        return $criteria;
        //return Entry::model()->findAll($criteria);
    }

    /**
     * Return CDbCriteria for filtering entries associated with a chapter range
     * @param $book, string of the Bible book, e.g. 'Genesis'
     * @param startChapter, integer of a specific chapter
     * @param endChapter, integer of a specific chapter
     * @return CDbCriteria for the Entry table
     */
    public static function entriesByChapterRangeCriteria($book, $startChapter, $endChapter=0) {
        // if endChapter not given, set range to single chapter
        if ($endChapter == 0)
            $endChapter = $startChapter;

        $lowerBound = BibleVerse::verse($book, $startChapter, 1);
        $upperBound = BibleVerse::lastVerse($book, $endChapter);
        $condition = '(start_verse_id BETWEEN :lower AND :upper) OR (end_verse_id BETWEEN :lower AND :upper) OR (:lower >= start_verse_id AND :upper <= end_verse_id)';
        $params = array(':lower' => $lowerBound->verse_id, ':upper' => $upperBound->verse_id);
        $criteria = new CDbCriteria(array(
                    'condition' => $condition,
                    'params' => $params,
                ));

        return $criteria;
    }

    /**
     * Return CDbCriteria for filtering entries associated with a verse range
     * If called, at least one of startVerse or endVerse is nonzero; startChapter must be nonzero.
     * If endVerse is not specified, default it to what startVerse is.
     * If endChapter is not specified, default it to startChapter.
     * If startVerse is not specified, default it to 1.
     * @param $book, string of the Bible book, e.g. 'Genesis'
     * @param startChapter, integer of a specific chapter
     * @param endChapter, integer of a specific chapter
     * @param startVerse, integer of a specific verse
     * @param endVerse, integer of a specific verse
     * @return CDbCriteria for entries where passages fall completely within the
     * specified range (except if range is 1 verse, get all entries containing that
     * verse).
     */
    public static function entriesByVerseRangeCriteria($book, $startChapter, $startVerse=0, $endChapter=0, $endVerse=0) {
        // set default parameters
        if ($endChapter == 0)
            $endChapter = $startChapter;
        if ($startVerse == 0)
            $startVerse = 1;
        if ($endVerse == 0)
            $endVerse = $startVerse;

        $lowerBound = BibleVerse::verse($book, $startChapter, $startVerse);
        $upperBound = BibleVerse::verse($book, $endChapter, $endVerse);

        // one verse
        if ($startVerse == $endVerse && $startChapter == $endChapter) {
            $condition = '(:lower BETWEEN start_verse_id AND end_verse_id)';
            $params = array(':lower' => $lowerBound->verse_id);
        }
        // range of verses
        else {
            $condition = '(start_verse_id >= :lower) AND (end_verse_id <= :upper)';
            $params = array(':lower' => $lowerBound->verse_id, ':upper' => $upperBound->verse_id);
        }
        $criteria = new CDbCriteria(array(
                    'condition' => $condition,
                    'params' => $params,
                ));

        return $criteria;
    }

    /**
     * @return string the associated database table name
     */
    public function tableName() {
        return '{{entry}}';
    }

    /**
     * @return array validation rules for model attributes.
     */
    public function rules() {
        // NOTE: you should only define rules for those attributes that
        // will receive user inputs.
        return array(
            array('entry_author_id, entry_text, date_added', 'required'),
            array('start_verse_id, end_verse_id, entry_author_id, reference_id, depth, start_word, ref_start_page_num, ref_end_page_num', 'numerical', 'integerOnly' => true),
            array('depth', 'in', 'range' => array(1, 2, 3, 4, 5), 'message' => 'If specified, depth must be an integer between 1 and 5.'),
            array('heading', 'length')
        );
    }

    /**
     * @return array relational rules.
     */
    public function relations() {
        // NOTE: you may need to adjust the relation name and the related
        // class name for the relations automatically generated below.
        return array(
            'user' => array(self::BELONGS_TO, 'User', 'entry_author_id'),
            'reference' => array(self::BELONGS_TO, 'Reference', 'reference_id'),
            'categories' => array(self::MANY_MANY, 'Category',
            'tbl_entry_category(entry_id, category_id)'),
            'startverse' => array(self::BELONGS_TO, 'BibleVerse', 'start_verse_id'),
            'endverse' => array(self::BELONGS_TO, 'BibleVerse', 'end_verse_id'),
        );
    }

    /**
     * @return array customized attribute labels (name=>label)
     */
    public function attributeLabels() {
        return array(
            'entry_id' => 'ID',
            'passage_ref' => 'Passage',
            'entry_author_id' => 'Added by',
            'userName' => 'Added by',
            'heading' => 'Heading',
            'entry_text' => 'Entry Text',
            'start_word' => 'Start Word',
            'depth' => 'Depth',
            'reference_id' => 'Reference',
            'pageRange' => 'Page range',
            'ref_start_page_num' => 'Start Page',
            'ref_end_page_num' => 'End Page',
            'date_added' => 'Date Added',
            'last_updated' => 'Last Updated',
        );
    }

    /* Magic getter methods */

    /**
     * @return string of the passage reference
     */
    public function getPassageReference() {
        if (!$this->startverse)
            return '';

        // range: 1 verse
        if ($this->startverse == $this->endverse)
            return $this->startverse->verseReference();

        $book = $this->startverse->book;

        // range: whole book
        if ($this->startverse->chapter == 1 && $this->startverse->verse == 1
                && $this->endverse->chapter == BibleVerse::chaptersInBook($this->startverse->book)
                && $this->endverse->isLastVerseInChapter()
        ) {
            return $book;
        }

        // range: chapter
        if ($this->startverse->verse == 1 && $this->endverse->isLastVerseInChapter()) {
            if ($this->startverse->chapter == $this->endverse->chapter)
                return $book . ' ' . $this->startverse->chapter;
            else {
                return $book .= ' ' . $this->startverse->chapter . '-' . $this->endverse->chapter;
            }
        }

        // range: standard/generic case
        $passageRef = $this->startverse->verseReference();

        if ($this->endverse->chapter == $this->startverse->chapter)
            // e.g. John 1:2-4
            $passageRef = $passageRef . '-' . $this->endverse->verse;
        else
            // e.g. John 1:2-4:3
            $passageRef = $passageRef . '-' . $this->endverse->chapter
                    . ':' . $this->endverse->verse;

        return $passageRef;
    }

    /**
     *
     * @return reference information string
     */
    public function getReferenceInfo() {
        if ($this->reference)
            return $this->reference->referenceAsString;
        else
            return "(no reference cited)";
    }

    public function getPageRange() {
        if ($this->ref_start_page_num) {
            if ($this->ref_end_page_num)
                return $this->ref_start_page_num . '-' . $this->ref_end_page_num;
            else
                return $this->ref_start_page_num;
        }
    }
    /**
     * @return username
     */
    public function getUsername() {
        if ($this->user == null)
            return "";
        return $this->user->username;
    }

    /**
     * Auto-populates date fields in the record
     * @return boolean result of processing before saving
     */
    public function beforeSave() {
        if (parent::beforeSave()) {
            $this->last_updated = date('Y-m-d H:i:s', time());
            return true;
        } else
            return false;
    }

}