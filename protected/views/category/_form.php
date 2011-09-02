<div class="form">

<?php echo CHtml::beginForm(); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo CHtml::errorSummary($model); ?>

	<div class="row">
		<?php echo CHtml::activeLabelEx($model,'name'); ?>
		<?php echo CHtml::activeTextField($model,'name',array('size'=>20,'maxlength'=>20)); ?>
		<?php echo CHtml::error($model,'name'); ?>
	</div>

	<div class="row">
		<?php echo CHtml::activeLabelEx($model,'description'); ?>
		<?php echo CHtml::activeTextArea($model,'description',array('rows'=>6, 'cols'=>50)); ?>
		<?php echo CHtml::error($model,'description'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php echo CHtml::endForm(); ?>

</div><!-- form -->