<?php
$this->breadcrumbs=array(
	'Entries'=>array('index'),
	$model->entry_id,
);
?>
<h1>View Entry #<?php echo $model->entry_id; ?></h1>

<ul class="actions">
	<li><?php echo CHtml::link('List Entry',array('index')); ?></li>
	<li><?php echo CHtml::link('Create Entry',array('create')); ?></li>
	<li><?php echo CHtml::link('Update Entry',array('update','id'=>$model->entry_id)); ?></li>
	<li><?php echo CHtml::linkButton('Delete Entry',array('submit'=>array('delete','id'=>$model->entry_id),'confirm'=>'Are you sure to delete this item?')); ?></li>
</ul><!-- actions -->

<?php

    $categories = $model->categories;
    echo "<p>Categories:<ul>\n";
    foreach ($categories as $cat) {
        echo "<li>" . CHtml::link($cat->name, array('/category/view','id'=>$cat->category_id)) . "</li>";
    }
    echo "</ul></p>\n";

    $this->widget('zii.widgets.CDetailView', array(
    'data' => $model,
    'attributes' => array(
        'entry_id',
        'passageReference',
        'username',
        'heading',
        'entry_text',
        'start_word',
        'depth',
        'reference_id',
        'referenceInfo',
        'ref_start_page_num',
        'ref_end_page_num',
        'date_added',
        'last_updated',
    ),
));

 ?>
