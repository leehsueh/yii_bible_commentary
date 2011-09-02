<?php
$this->breadcrumbs=array(
	'Authors',
);
?>

<h1>List Author</h1>

<ul class="actions">
	<li><?php echo CHtml::link('Create Author',array('create')); ?></li>
</ul><!-- actions -->

<?php $this->widget('zii.widgets.grid.CGridView', array(
	'dataProvider'=>$dataProvider,
	'columns'=>array(
		'author_id',
		'first_name',
		'last_name',
		'notes',
		array(
			'class'=>'CButtonColumn',
		),
	),
)); ?>
