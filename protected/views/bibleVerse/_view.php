<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('verse_id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->verse_id), array('view', 'id'=>$data->verse_id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('book')); ?>:</b>
	<?php echo CHtml::encode($data->book); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('chapter')); ?>:</b>
	<?php echo CHtml::encode($data->chapter); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('verse')); ?>:</b>
	<?php echo CHtml::encode($data->verse); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('verse_text')); ?>:</b>
	<?php echo CHtml::encode($data->verse_text); ?>
	<br />


</div>