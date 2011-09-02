<?php

class BibleVerse extends CActiveRecord {
    /**
     * The followings are the available columns in table '{{bible_verse}}':
     * @var integer $verse_id
     * @var string $book
     * @var integer $chapter
     * @var integer $verse
     * @var string $verse_text
     */

    /**
     * Returns the static model of the specified AR class.
     * @return CActiveRecord the static model class
     */
    public static function model($className=__CLASS__) {
        return parent::model($className);
    }

    /**
     * Returns a set of rows containing the books in the bible
     */
    public static function booksInBible() {

        $criteria = new CDbCriteria(array(
                    'distinct' => true,
                    'select' => 'book',
                    'order' => 'verse_id ASC',
                    'limit' => 66
                ));

        return BibleVerse::model()->findAll($criteria);
    }

    /**
     * Returns the books in the bible as an array
     * @return array
     */
    public static function booksInBibleAsArray() {
        $bookModels = BibleVerse::booksInBible();
        $bookArray = array();
        foreach ($bookModels as $verseModel) {
            array_push($bookArray, $verseModel->getAttribute('book'));
        }
        return $bookArray;
    }

    public static function chaptersInBook($book='') {
        $criteria = new CDbCriteria(array(
                    'distinct' => true,
                    'select' => 'chapter',
                    'condition' => 'book = :book',
                    'params' => array(':book' => $book),
                ));

        $l = BibleVerse::model()->findAll($criteria);
        return count($l);
    }

    public static function verseInChapter($book='', $chapter=0) {

    }

    /**
     * Returns the last verse of the specified book and chapter
     * @return BibleVerse object
     */
    public static function lastVerse($book='', $chapter=0) {
        $condition = 'book = :book AND chapter = :chapter';
        $params = array(':book' => $book, ':chapter' => $chapter);
        $criteria = new CDbCriteria(array('condition' => $condition, 'params' => $params));
        $criteria->order = 'verse DESC';
        $criteria->limit = 1;
        return BibleVerse::model()->find($criteria);
    }

    /**
     * Returns the verse object of the specified book and chapter and verse
     * @return BibleVerse object
     */
    public static function verse($book='', $chapter=0, $verse=0) {
        $condition = 'book = :book AND chapter = :chapter AND verse = :verse';
        $params = array(':book' => $book, ':chapter' => $chapter, ':verse' => $verse);
        $criteria = new CDbCriteria(array('condition' => $condition, 'params' => $params));
        $criteria->limit = 1;
        $result = BibleVerse::model()->find($criteria);
        if ($result == null)
            return self::lastVerse($book, $chapter);
        else
            return $result;
    }

    /**
     *
     * @param <type> $book
     * @return <mixed> false if not valid, the book if valid
     */
    public static function isBookValid($book='') {
        if ($book == '' || strlen($book) < 2)
            return false;
        else {
            $criteria = new CDbCriteria(array(
                        'select' => 'book',
                        'order' => 'verse_id ASC',
                        'limit' => 1
                    ));

            // check if book is exact match or is first few letters of a book
            // (e.g. Mat returns Matthew)
            $condition = 'book like \'' . $book . '%\'';
            $criteria->condition = $condition;
            $result = BibleVerse::model()->find($criteria);
            if ($result && strlen($result->book) >= strlen($book))
                return $result->book;

            //TODO: check against set of valid abbreviation mappings
        }
        return false;
    }

    /* Instance methods */

    /**
     * @return string the associated database table name
     */
    public function tableName() {
        return '{{bible_verse}}';
    }

    /**
     * @return string of the verse reference
     */
    public function verseReference() {
        return $this->book . " " . $this->chapter . ":" . $this->verse;
    }

    /**
     *
     * @return boolean
     */
    public function isFirstVerseInChapter() {
        return $this->verse == 1;
    }

    /**
     *
     * @return boolean
     */
    public function isLastVerseInChapter() {
        $lastVerse = BibleVerse::lastVerse($this->book, $this->chapter);
        return $lastVerse->verse == $this->verse;
    }

    /**
     * @return array validation rules for model attributes.
     */
    public function rules() {
        // NOTE: you should only define rules for those attributes that
        // will receive user inputs.
        return array(
            array('book, chapter, verse, verse_text', 'required'),
            array('chapter, verse', 'numerical', 'integerOnly' => true),
            array('book', 'length', 'max' => 20),
        );
    }

    /**
     * @return array relational rules.
     */
    public function relations() {
        // NOTE: you may need to adjust the relation name and the related
        // class name for the relations automatically generated below.
        return array(
            'entries' => array(self::HAS_MANY, 'Entry', 'start_verse_id'),
        );
    }

    /**
     * @return array customized attribute labels (name=>label)
     */
    public function attributeLabels() {
        return array(
            'verse_id' => 'Verse',
            'book' => 'Book',
            'chapter' => 'Chapter',
            'verse' => 'Verse',
            'verse_text' => 'Verse Text',
        );
    }

}