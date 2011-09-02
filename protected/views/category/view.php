<?php
$this->breadcrumbs=array(
	'Categories'=>array('index'),
	$model->name,
);
?>
<h1>View Category #<?php echo $model->category_id; ?></h1>

<ul class="actions">
	<li><?php echo CHtml::link('List Category',array('index')); ?></li>
	<li><?php echo CHtml::link('Create Category',array('create')); ?></li>
	<li><?php echo CHtml::link('Update Category',array('update','id'=>$model->category_id)); ?></li>
	<li><?php echo CHtml::linkButton('Delete Category',array('submit'=>array('delete','id'=>$model->category_id),'confirm'=>'Are you sure to delete this item?')); ?></li>
	<li><?php echo CHtml::link('Manage Category',array('admin')); ?></li>
</ul><!-- actions -->

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'category_id',
		'name',
		'description',
	),
)); ?>
