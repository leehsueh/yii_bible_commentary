<?php
$this->breadcrumbs = array(
    'Entries',
);
?>

<h1>Entries</h1>

<ul class="actions">
    <li><?php echo CHtml::link('Create Entry', array('create')); ?></li>
    <li><?php echo CHtml::link('Manage Entry', array('admin')); ?></li>
</ul><!-- actions -->

<!-- <div id="filter_options" class="box prepend-top">
    <h3>Filter by passage</h3>
    <?php echo CHtml::beginForm(CHtml::normalizeUrl(''), 'get'); ?>

    <?php echo CHtml::errorSummary($filterFormModel); ?>

    <div class="row submit">
        <?php echo CHtml::activeLabelEx($filterFormModel, 'passage'); ?>
        <?php echo CHtml::activeTextField($filterFormModel, 'passage'); ?>
        (e.g. John, John1, joh 1:1, john 1:1-5, Joh 1:2-3:1, joh 13-14)
        <p id="parsed_passage">
            Book: <strong><?php echo $filterFormModel->book; ?></strong>,
            Start chapter: <strong><?php echo $filterFormModel->startChapter; ?></strong>,
            Start verse: <strong><?php echo $filterFormModel->startVerse; ?></strong>,
            End chapter: <strong><?php echo $filterFormModel->endChapter; ?></strong>,
            End verse: <strong><?php echo $filterFormModel->endVerse; ?></strong>
        </p>

        <?php
        echo CHtml::hiddenField('r', 'entry/index'); // this is needed to stay on the entry index page after form submission (when using GET)
        echo CHtml::submitButton('Submit');
        //echo CHtml::resetButton('Reset');
        ?>
        <script type="text/javascript">
            $(document).ready(function() {
                var toggleSubmitButton = function(event) {
                    console.log("Key Pressed: " + String.fromCharCode(event.keyCode) + "\n"
                            + "charCode: " + event.keyCode);

                    text = $(this).attr("value");
                    if (text)
                        $(this).siblings("input[type='submit']").show();
                    else
                        $(this).siblings("input[type='submit']").hide();
                }
                $("#EntryFilterForm_passage").keyup(toggleSubmitButton);
                $("#EntryFilterForm_passage").siblings("input[type='submit']").hide();
            });
        </script>
    </div>

    <?php echo CHtml::endForm(); ?>

    </div> -->
    <div>
        <div class="box prepend-top span-5">
            <h3>Filter by passage</h3>
            <?php echo CHtml::beginForm(CHtml::normalizeUrl('?r=entry/index'), 'get'); ?>

            <?php echo CHtml::errorSummary($filterFormModel); ?>

            <div class="row submit">
                <?php echo CHtml::activeLabelEx($filterFormModel, 'passage'); ?>
                <?php echo CHtml::activeTextField($filterFormModel, 'passage'); ?>
                (e.g. John, John1, joh 1:1, john 1:1-5, Joh 1:2-3:1, joh 13-14)
                <p id="parsed_passage">
                    Book: <strong><?php echo $filterFormModel->book; ?></strong>,
                    Start chapter: <strong><?php echo $filterFormModel->startChapter; ?></strong>,
                    Start verse: <strong><?php echo $filterFormModel->startVerse; ?></strong>,
                    End chapter: <strong><?php echo $filterFormModel->endChapter; ?></strong>,
                    End verse: <strong><?php echo $filterFormModel->endVerse; ?></strong>
                </p>
                
                <?php 
                    if (is_array($filterFormModel->passageText)) {
                        if (count($filterFormModel->passageText) < 10) {
                            echo "<h3>Passage Text</h3>";
                            echo "<ul>";
                            foreach ($filterFormModel->passageText as $ref => $text) {
                                echo "<li>" . $ref . " " . $text . "</li>";
                            }
                            echo "</ul>";
                        } else {
                            echo "Passage is too long to preview.";
                        }
                    }
                    var_dump($filterFormModel->categories);
                 ?>

                <?php 
                    echo CHtml::activeLabelEx($filterFormModel, 'categories');
                    echo '<ul>';
                    $allCategories = Category::model()->findAll(array('select'=>'category_id, name'));
                    echo CHtml::activeCheckBoxList(
                        $filterFormModel, 
                        'categories', 
                        CHtml::listData($allCategories, 'category_id', 'name'),
                        array(
                            'template'=>'<li>{input} {label}</li>',
                            'separator'=>'',
                            'checkAll' =>'<em>Toggle All</em>',
                            'checkAllLast' => true
                        )
                    );
                    echo '</ul>';
                ?>

                <?php
                //echo CHtml::hiddenField('r', 'entry/index'); // this is needed to stay on the entry index page after form submission (when using GET)
                echo CHtml::submitButton('Submit');
                echo "&nbsp;";
                echo CHtml::link('Clear Filter', array('index'));
                ?>
            </div>

            <?php echo CHtml::endForm(); ?>
        </div>
        <div class="span-17 last">
        <?php
        $this->widget('zii.widgets.grid.CGridView', array(
            'dataProvider' => $dataProvider,
            'selectableRows' => 0,
            'enableSorting' => true,
            'columns' => array(
                'heading',
                'passageReference',
                'entry_text:html',
                'start_word',
                'depth',
                array(
                    'name' => 'Last Updated',
                    'value' => 'date("m/d/Y",strtotime($data->last_updated))'
                ),
                'categoriesList',
                array(
                    'class' => 'CButtonColumn',
                ),
            ),
        )); ?>
        </div>
    </div>
