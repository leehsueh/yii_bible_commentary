<?php
$this->breadcrumbs=array(
	'Authors'=>array('index'),
	$model->author_id,
);
?>
<h1>View Author #<?php echo $model->author_id; ?></h1>

<ul class="actions">
	<li><?php echo CHtml::link('List Author',array('index')); ?></li>
	<li><?php echo CHtml::link('Create Author',array('create')); ?></li>
	<li><?php echo CHtml::link('Update Author',array('update','id'=>$model->author_id)); ?></li>
	<li><?php echo CHtml::linkButton('Delete Author',array('submit'=>array('delete','id'=>$model->author_id),'confirm'=>'Are you sure to delete this item?')); ?></li>
</ul><!-- actions -->

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'author_id',
		'first_name',
		'last_name',
		'notes',
	),
)); ?>
