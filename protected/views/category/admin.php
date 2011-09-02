<?php
$this->breadcrumbs=array(
	'Categories'=>array('index'),
	'Manage',
);
?>
<h1>Manage Categories</h1>

<ul class="actions">
	<li><?php echo CHtml::link('List Category',array('index')); ?></li>
	<li><?php echo CHtml::link('Create Category',array('create')); ?></li>
</ul><!-- actions -->

<?php $this->widget('zii.widgets.grid.CGridView', array(
	'dataProvider'=>$dataProvider,
	'columns'=>array(
		'category_id',
		'name',
		'description',
		array(
			'class'=>'CButtonColumn',
		),
	),
)); ?>
