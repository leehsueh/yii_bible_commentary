<div class="form">

<?php echo CHtml::beginForm(); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo CHtml::errorSummary($model); ?>

	<div class="row">
		<?php echo CHtml::activeLabelEx($model,'first_name'); ?>
		<?php echo CHtml::activeTextField($model,'first_name',array('size'=>60,'maxlength'=>128)); ?>
		<?php echo CHtml::error($model,'first_name'); ?>
	</div>

	<div class="row">
		<?php echo CHtml::activeLabelEx($model,'last_name'); ?>
		<?php echo CHtml::activeTextField($model,'last_name',array('size'=>60,'maxlength'=>128)); ?>
		<?php echo CHtml::error($model,'last_name'); ?>
	</div>

	<div class="row">
		<?php echo CHtml::activeLabelEx($model,'notes'); ?>
		<?php echo CHtml::activeTextArea($model,'notes',array('rows'=>6, 'cols'=>50)); ?>
		<?php echo CHtml::error($model,'notes'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php echo CHtml::endForm(); ?>

</div><!-- form -->