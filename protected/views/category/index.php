<?php
$this->breadcrumbs=array(
	'Categories',
);
?>

<h1>Categories</h1>

<ul class="actions">
	<li><?php echo CHtml::link('Create Category',array('create')); ?></li>
	<li><?php echo CHtml::link('Manage Category',array('admin')); ?></li>
</ul><!-- actions -->

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
