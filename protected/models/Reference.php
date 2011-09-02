<?php

class Reference extends CActiveRecord {
    /**
     * The followings are the available columns in table '{{reference}}':
     * @var integer $reference_id
     * @var integer $author_id
     * @var string $title
     * @var string $isbn
     * @var string $url
     * @var string $publication_date
     * @var string $notes
     */

    /**
     * Returns the static model of the specified AR class.
     * @return CActiveRecord the static model class
     */
    public static function model($className=__CLASS__) {
        return parent::model($className);
    }

    /**
     * @return string the associated database table name
     */
    public function tableName() {
        return '{{reference}}';
    }

    /**
     *
     * @return string representation of the reference record
     */
    public function getReferenceAsString() {
        if ($this->title)
                return $this->authorName . ', ' . $this->title;
        else if ($this->isbn)
                return $this->authorName . ', ' . $this->isbn;
        else
            return $this->authorName . ', (no title), ' . $this->reference_id;
    }

    public function getAuthorName() {
        if ($this->author)
            return $this->author->authorName;
        else
            return '(no author)';
    }

    /**
     * @return array validation rules for model attributes.
     */
    public function rules() {
        // NOTE: you should only define rules for those attributes that
        // will receive user inputs.
        return array(
            array('title', 'required'),
            array('author_id', 'numerical', 'integerOnly' => true),
            array('title', 'length', 'max' => 256),
            array('isbn', 'length', 'max' => 128),
            array('url', 'length', 'max' => 512),
            array('publication_date, notes', 'safe'),
        );
    }

    /**
     * @return array relational rules.
     */
    public function relations() {
        // NOTE: you may need to adjust the relation name and the related
        // class name for the relations automatically generated below.
        return array(
            'author' => array(self::BELONGS_TO, 'Author', 'author_id'),
        );
    }

    /**
     * @return array customized attribute labels (name=>label)
     */
    public function attributeLabels() {
        return array(
            'reference_id' => 'Reference',
            'author_id' => 'Author',
            'title' => 'Title',
            'isbn' => 'ISBN #',
            'url' => 'URL',
            'publication_date' => 'Publication Date',
            'notes' => 'Notes',
        );
    }

    /**
     * Auto-populates date fields in the record
     * @return boolean result of processing before saving
     */
    public function beforeSave() {
        if (parent::beforeSave()) {
            if ($this->publication_date == '0000-00-00' || $this->publication_date == "")
                $this->publication_date = null;
            return true;
        } else
            return false;
    }
}