<?php
$this->breadcrumbs=array(
	'Categories'=>array('index'),
	'Create',
);
?>
<h1>Create Category</h1>

<ul class="actions">
	<li><?php echo CHtml::link('List Category',array('index')); ?></li>
	<li><?php echo CHtml::link('Manage Category',array('admin')); ?></li>
</ul><!-- actions -->

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>