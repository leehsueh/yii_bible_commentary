<?php
$this->breadcrumbs=array(
	'References',
);
?>

<h1>List Reference</h1>

<ul class="actions">
	<li><?php echo CHtml::link('Create Reference',array('create')); ?></li>
</ul><!-- actions -->

<?php $this->widget('zii.widgets.grid.CGridView', array(
	'dataProvider'=>$dataProvider,
	'columns'=>array(
		'reference_id',
		'authorName',
		'title',
		'isbn',
		'url',
		'publication_date',
		'notes',
		array(
			'class'=>'CButtonColumn',
		),
	),
)); ?>
