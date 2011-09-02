<?php
$this->breadcrumbs=array(
	'Entries'=>array('index'),
	$model->entry_id=>array('view','id'=>$model->entry_id),
	'Update',
);
?>

<h1>Update Entry <?php echo $model->entry_id; ?></h1>

<ul class="actions">
	<li><?php echo CHtml::link('List Entry',array('index')); ?></li>
	<li><?php echo CHtml::link('Create Entry',array('create')); ?></li>
	<li><?php echo CHtml::link('View Entry',array('view','id'=>$model->entry_id)); ?></li>
	<li><?php echo CHtml::link('Manage Entry',array('admin')); ?></li>
</ul><!-- actions -->

<?php echo $this->renderPartial('_form', array('model'=>$model, 'biblePassage'=>$biblePassage, 'categoryOptions'=>$categoryOptions)); ?>