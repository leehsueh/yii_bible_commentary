<?php

class ReferenceTest extends WebTestCase
{
	public $fixtures=array(
		'references'=>'Reference',
	);

	public function testShow()
	{
		$this->open('?r=reference/view&id=1');
	}

	public function testCreate()
	{
		$this->open('?r=reference/create');
	}

	public function testUpdate()
	{
		$this->open('?r=reference/update&id=1');
	}

	public function testDelete()
	{
		$this->open('?r=reference/view&id=1');
	}

	public function testList()
	{
		$this->open('?r=reference/index');
	}

	public function testAdmin()
	{
		$this->open('?r=reference/admin');
	}
}
