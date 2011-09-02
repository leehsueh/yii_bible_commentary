<?php
$this->breadcrumbs=array(
	'Bible Verses',
);
?>

<h1>List BibleVerse</h1>

<ul class="actions">

</ul><!-- actions -->

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
