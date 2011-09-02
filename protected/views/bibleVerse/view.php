<?php
$this->breadcrumbs=array(
	'Bible Verses'=>array('index'),
	$model->verse_id,
);
?>
<h1>View BibleVerse #<?php echo $model->verse_id; ?></h1>

<ul class="actions">
	<li><?php echo CHtml::link('List BibleVerse',array('index')); ?></li>

</ul><!-- actions -->

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'verse_id',
		'book',
		'chapter',
		'verse',
		'verse_text',
	),
)); ?>
