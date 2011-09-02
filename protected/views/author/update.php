<?php
$this->breadcrumbs=array(
	'Authors'=>array('index'),
	$model->author_id=>array('view','id'=>$model->author_id),
	'Update',
);
?>

<h1>Update Author <?php echo $model->author_id; ?></h1>

<ul class="actions">
	<li><?php echo CHtml::link('List Author',array('index')); ?></li>
	<li><?php echo CHtml::link('Create Author',array('create')); ?></li>
	<li><?php echo CHtml::link('View Author',array('view','id'=>$model->author_id)); ?></li>
	<li><?php echo CHtml::link('Manage Author',array('admin')); ?></li>
</ul><!-- actions -->

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>