<?php

class EntryCategory extends CActiveRecord {
    /**
     * The followings are the available columns in table '{{entry_category}}':
     * @var integer $entry_category_id
     * @var integer $entry_id
     * @var integer $category_id
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
        return '{{entry_category}}';
    }

    /**
     * @return array validation rules for model attributes.
     */
    public function rules() {
        // NOTE: you should only define rules for those attributes that
        // will receive user inputs.
        return array(
            array('entry_id, category_id', 'required'),
            array('entry_id, category_id', 'numerical', 'integerOnly' => true),
        );
    }

    /**
     * @return array relational rules.
     */
    public function relations() {
        // NOTE: you may need to adjust the relation name and the related
        // class name for the relations automatically generated below.
        return array(
            'entry' => array(self::BELONGS_TO, 'Entry', 'entry_id'),
            'category' => array(self::BELONGS_TO, 'Category', 'category_id'),
        );
    }

    /**
     * @return array customized attribute labels (name=>label)
     */
    public function attributeLabels() {
        return array(
            'entry_category_id' => 'Entry Category',
            'entry_id' => 'Entry',
            'category_id' => 'Category',
        );
    }

}