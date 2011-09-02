<?php
$this->breadcrumbs=array(
	'Categories'=>array('index'),
	$model->name=>array('view','id'=>$model->category_id),
	'Update',
);
?>

<h1>Update Category <?php echo $model->category_id; ?></h1>

<ul class="actions">
	<li><?php echo CHtml::link('List Category',array('index')); ?></li>
	<li><?php echo CHtml::link('Create Category',array('create')); ?></li>
	<li><?php echo CHtml::link('View Category',array('view','id'=>$model->category_id)); ?></li>
	<li><?php echo CHtml::link('Manage Category',array('admin')); ?></li>
</ul><!-- actions -->

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>