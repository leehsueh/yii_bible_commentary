<div class="form">

    <?php echo CHtml::beginForm(); ?>

    <p class="note">Fields with <span class="required">*</span> are required.</p>

    <?php echo CHtml::errorSummary($model); ?>

    <div class="row">
        <?php echo CHtml::activeLabelEx($model, 'categories'); ?>
        <?php
            echo CHtml::listBox('Entry[categories]', null,
                CHtml::listData(Category::model()->findAll(), 'category_id', 'name'),
                array('size' => 8, 'multiple' => 'true', )); ?>
        <?php echo CHtml::error($model, 'categories'); ?>
    </div>

    <div class="row">
        <?php echo CHtml::error($model, 'start_verse_id'); ?>
        <?php echo CHtml::error($model, 'end_verse_id'); ?>
        <?php echo CHtml::errorSummary($biblePassage); ?>
        <?php echo CHtml::activeLabelEx($biblePassage, 'passage'); ?>
        <?php echo CHtml::activeTextField($biblePassage, 'passage'); ?>
        (e.g. John, John1, joh 1:1, john 1:1-5, Joh 1:2-3:1, joh 13-14)
        <p id="parsed_passage">
            Book: <strong><?php echo $biblePassage->book; ?></strong>,
            Start chapter: <strong><?php echo $biblePassage->startChapter; ?></strong>,
            Start verse: <strong><?php echo $biblePassage->startVerse; ?></strong>,
            End chapter: <strong><?php echo $biblePassage->endChapter; ?></strong>,
            End verse: <strong><?php echo $biblePassage->endVerse; ?></strong>
        </p>
    </div>

    <div class="row">
        <?php echo CHtml::activeLabelEx($model, 'entry_author_id'); ?>
        <?php //echo CHtml::textField('Entry[entry_author_id]',$model->entry_author_id); ?>
        <?php
        echo CHtml::activeDropDownList(
                $model,
                'entry_author_id',
                CHtml::listData(
                        User::model()->findAllByPk(Yii::app()->getModule('user')->user()->id),
                        'id',
                        'username'
                )
        ); ?>
        <?php echo CHtml::error($model, 'entry_author_id'); ?>
    </div>

    <div class="row">
        <?php echo CHtml::activeLabelEx($model, 'heading'); ?>
        <?php echo CHtml::activeTextField($model, 'heading', array('size' => 32)); ?>
        <?php echo CHtml::error($model, 'heading'); ?>
    </div>

    <div class="row">
        <?php echo CHtml::activeLabelEx($model, 'entry_text'); ?>
        <?php echo CHtml::activeTextArea($model, 'entry_text', array('rows' => 6, 'cols' => 50)); ?>
        <?php echo CHtml::error($model, 'entry_text'); ?>
    </div>

    <div class="row">
        <?php echo CHtml::activeLabelEx($model, 'start_word'); ?>
        <?php echo CHtml::activeTextField($model, 'start_word', array('size' => 4)); ?>
        <?php echo CHtml::error($model, 'start_word'); ?>
    </div>

    <div class="row">
        <?php echo CHtml::activeLabelEx($model, 'depth'); ?>
        <?php echo CHtml::activeTextField($model, 'depth'); ?>
        <?php echo CHtml::error($model, 'depth'); ?>
    </div>

    <div class="row">
        <?php echo CHtml::activeLabelEx($model, 'reference_id'); ?>
        <?php
        echo CHtml::activeDropDownList(
                $model,
                'reference_id',
                CHtml::listData(
                        Reference::model()->findAll(),
                        'reference_id',
                        'referenceAsString'
                ),
                array('empty' => '(select)')
        );
        ?>
        <?php 
        echo CHtml::error($model, 'reference_id');
        echo '&nbsp;';
        echo CHtml::link('Add new (leaves this page)', 'index.php?r=reference/create');
        ?>
    </div>

    <div class="row">
        <?php echo CHtml::label('Page range','Entry[ref_start_page_num]');
        //CHtml::activeLabelEx($model,'ref_start_page_num'); ?>
        <?php echo CHtml::activeTextField($model, 'ref_start_page_num', array('size'=>3)); ?>
        <?php echo CHtml::activeTextField($model, 'ref_end_page_num', array('size'=>3)); ?>
        <?php echo CHtml::error($model, 'ref_start_page_num'); ?>
        <?php echo CHtml::error($model, 'ref_end_page_num'); ?>
        <?php

        /*$this->widget('zii.widgets.jui.CJuiAutoComplete',
                array(
                    'model' => Reference::model(),
                    'attribute' => 'title',
                    'sourceUrl' => array('/reference/autocomplete'),
                    'options'=>array(
                        'minLength'=>'2',
                    ),
                ));*/
        
        $this->widget('system.web.widgets.CAutoComplete',
                array(
                    'model' => Reference::model(),
                    'attribute' => 'title',
                    'url' => array('/reference/autocomplete'),
                ));
                
        

        ?>
    </div>

    <div class="row buttons">
<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
    </div>

<?php echo CHtml::endForm(); ?>

</div><!-- form -->