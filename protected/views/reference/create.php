<?php
$this->breadcrumbs=array(
	'References'=>array('index'),
	'Create',
);
?>
<h1>Create Reference</h1>

<ul class="actions">
	<li><?php echo CHtml::link('List Reference',array('index')); ?></li>
	<li><?php echo CHtml::link('Manage Reference',array('admin')); ?></li>
</ul><!-- actions -->

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>