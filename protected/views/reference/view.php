<?php
$this->breadcrumbs=array(
	'References'=>array('index'),
	$model->title,
);
?>
<h1>View Reference #<?php echo $model->reference_id; ?></h1>

<ul class="actions">
	<li><?php echo CHtml::link('List Reference',array('index')); ?></li>
	<li><?php echo CHtml::link('Create Reference',array('create')); ?></li>
	<li><?php echo CHtml::link('Update Reference',array('update','id'=>$model->reference_id)); ?></li>
	<li><?php echo CHtml::linkButton('Delete Reference',array('submit'=>array('delete','id'=>$model->reference_id),'confirm'=>'Are you sure to delete this item?')); ?></li>
</ul><!-- actions -->

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'reference_id',
		'author_id',
		'title',
		'isbn',
		'url',
		'publication_date',
		'notes',
	),
)); ?>
