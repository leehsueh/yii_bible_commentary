<?php

class Author extends CActiveRecord
{
	/**
	 * The followings are the available columns in table '{{author}}':
	 * @var integer $author_id
	 * @var string $first_name
	 * @var string $last_name
	 * @var string $notes
	 */

	/**
	 * Returns the static model of the specified AR class.
	 * @return CActiveRecord the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return '{{author}}';
	}

        /**
         * @return authorName
         */
        public function getAuthorName() {
            if ($this->first_name != null)
                return $this->last_name . ", " . $this->first_name;
            else
                return $this->last_name;
        }

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('last_name', 'required'),
			array('first_name, last_name', 'length', 'max'=>128),
			array('notes', 'safe'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
                    'references' => array(self::HAS_MANY, 'Reference', 'author_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'author_id' => 'Author',
			'first_name' => 'First Name',
			'last_name' => 'Last Name',
			'notes' => 'Notes',
		);
	}
}