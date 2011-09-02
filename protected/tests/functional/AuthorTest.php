<?php

class AuthorTest extends WebTestCase
{
	public $fixtures=array(
		'authors'=>'Author',
	);

	public function testShow()
	{
		$this->open('?r=author/view&id=1');
	}

	public function testCreate()
	{
		$this->open('?r=author/create');
	}

	public function testUpdate()
	{
		$this->open('?r=author/update&id=1');
	}

	public function testDelete()
	{
		$this->open('?r=author/view&id=1');
	}

	public function testList()
	{
		$this->open('?r=author/index');
	}

	public function testAdmin()
	{
		$this->open('?r=author/admin');
	}
}
