<div class="form">

<?php echo CHtml::beginForm(); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo CHtml::errorSummary($model); ?>

	<div class="row">
		<?php echo CHtml::activeLabelEx($model,'author_id'); ?>
                <?php echo CHtml::activeDropDownList(
                                $model,
                                'author_id',
                                CHtml::listData(
                                        Author::model()->findAll(),
                                        'author_id',
                                        'authorName'
                                        ),
                                array('empty'=>'(select)')
                                );
                      echo '&nbsp;';
                      echo CHtml::link('Add new (leaves this page)', 'index.php?r=author/create');
                ?>
		<?php echo CHtml::error($model,'author_id'); ?>
	</div>

	<div class="row">
		<?php echo CHtml::activeLabelEx($model,'title'); ?>
		<?php echo CHtml::activeTextField($model,'title',array('size'=>60,'maxlength'=>256)); ?>
		<?php echo CHtml::error($model,'title'); ?>
	</div>

	<div class="row">
		<?php echo CHtml::activeLabelEx($model,'isbn'); ?>
		<?php echo CHtml::activeTextField($model,'isbn',array('size'=>60,'maxlength'=>128)); ?>
		<?php echo CHtml::error($model,'isbn'); ?>
	</div>

	<div class="row">
		<?php echo CHtml::activeLabelEx($model,'url'); ?>
		<?php echo CHtml::activeTextField($model,'url',array('size'=>60,'maxlength'=>512)); ?>
		<?php echo CHtml::error($model,'url'); ?>
	</div>

	<div class="row">
		<?php echo CHtml::activeLabelEx($model,'publication_date'); ?>
		<?php echo CHtml::activeTextField($model,'publication_date'); ?>
		<?php echo CHtml::error($model,'publication_date'); ?>
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