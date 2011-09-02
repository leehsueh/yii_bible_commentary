<?php
$this->breadcrumbs=array(
	'Entries'=>array('index'),
	'Create',
);
?>
<h1>Create Entry</h1>

<ul class="actions">
	<li><?php echo CHtml::link('List Entry',array('index')); ?></li>
	<li><?php echo CHtml::link('Manage Entry',array('admin')); ?></li>
</ul><!-- actions -->

<?php echo $this->renderPartial('_form', array('model'=>$model,'biblePassage'=>$biblePassage)); ?>