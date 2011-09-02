<?php
$this->breadcrumbs=array(
	'Entries'=>array('index'),
	'Manage',
);
?>
<h1>Manage Entries</h1>

<ul class="actions">
	<li><?php echo CHtml::link('List Entry',array('index')); ?></li>
	<li><?php echo CHtml::link('Create Entry',array('create')); ?></li>
</ul><!-- actions -->

<?php $this->widget('zii.widgets.grid.CGridView', array(
	'dataProvider'=>$dataProvider,
	'columns'=>array(
		'entry_id',
		'start_verse_id',
		'end_verse_id',
		'entry_author_id',
		'heading',
		'entry_text',
		/*
		'start_word',
		'depth',
		'ref_author',
		'ref_start_page_num',
		'ref_end_page_num',
		'ref_source',
		'date_added',
		'last_updated',
		*/
		array(
			'class'=>'CButtonColumn',
		),
	),
)); ?>
