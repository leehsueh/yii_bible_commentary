<?php

class EntryTest extends WebTestCase
{
	public $fixtures=array(
		'entries'=>'Entry',
	);

	public function testShow()
	{
		$this->open('?r=entry/view&id=1');
	}

	public function testCreate()
	{
		$this->open('?r=entry/create');
	}

	public function testUpdate()
	{
		$this->open('?r=entry/update&id=1');
	}

	public function testDelete()
	{
		$this->open('?r=entry/view&id=1');
	}

	public function testList()
	{
		$this->open('?r=entry/index');
	}

	public function testAdmin()
	{
		$this->open('?r=entry/admin');
	}
}
