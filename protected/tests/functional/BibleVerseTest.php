<?php

class BibleVerseTest extends WebTestCase
{
	public $fixtures=array(
		'bibleVerses'=>'BibleVerse',
	);

	public function testShow()
	{
		$this->open('?r=bibleVerse/view&id=1');
	}

	public function testCreate()
	{
		$this->open('?r=bibleVerse/create');
	}

	public function testUpdate()
	{
		$this->open('?r=bibleVerse/update&id=1');
	}

	public function testDelete()
	{
		$this->open('?r=bibleVerse/view&id=1');
	}

	public function testList()
	{
		$this->open('?r=bibleVerse/index');
	}

	public function testAdmin()
	{
		$this->open('?r=bibleVerse/admin');
	}
}
