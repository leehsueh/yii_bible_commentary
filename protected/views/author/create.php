<?php
$this->breadcrumbs=array(
	'Authors'=>array('index'),
	'Create',
);
?>
<h1>Create Author</h1>

<ul class="actions">
	<li><?php echo CHtml::link('List Author',array('index')); ?></li>
	<li><?php echo CHtml::link('Manage Author',array('admin')); ?></li>
</ul><!-- actions -->

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>