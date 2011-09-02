<?php
$this->breadcrumbs=array(
	'References'=>array('index'),
	$model->title=>array('view','id'=>$model->reference_id),
	'Update',
);
?>

<h1>Update Reference <?php echo $model->reference_id; ?></h1>

<ul class="actions">
	<li><?php echo CHtml::link('List Reference',array('index')); ?></li>
	<li><?php echo CHtml::link('Create Reference',array('create')); ?></li>
	<li><?php echo CHtml::link('View Reference',array('view','id'=>$model->reference_id)); ?></li>
	<li><?php echo CHtml::link('Manage Reference',array('admin')); ?></li>
</ul><!-- actions -->

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>