<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of EntryFilterForm
 *
 * @author leehsueh
 */
class EntryFilterForm extends CFormModel {

    // fields for filtering by passage
    public $book;
    public $startChapter;
    public $endChapter;
    public $startVerse;
    public $endVerse;
    public $passage;
    //private $passageRegEx = '/(?P<book>([A-Za-z0-9 ]+)) (?P<start_chapter>[0-9]+)(:(?P<start_verse>[0-9]+)(-(?P<end_chp_or_verse>[0-9]+)(:(?P<end_verse>[0-9]+))?)?)?/';
    private $passageRegEx = '/(?P<book>([12]?[A-Za-z ]+[A-Za-z]))( ?(?P<start_chapter>[0-9]+)((:(?P<start_verse>[0-9]+))? ?(- ?(?P<end_chp_or_verse>[0-9]+)(:(?P<end_verse>[0-9]+))?)?)?)?/';
    /*     * **
     * Regular expression test cases
     * John
     * 1 Corinthians
     * Song of Solomon
     * John1234
     * John 1
     * John1 1
     * John 1:1
     * John 1-2
     * John 1:11-21
     * John 12:1-13:4
     */

     private $passageText;  // for displaying the verse text on search results page

     // fields for filtering by category
     public $categories;    // an array of id values

     public function getPassageText() {
         if (isset($this->book) && isset($this->startChapter) && isset($this->startVerse)) {
            $sv = BibleVerse::verse($this->book, $this->startChapter, $this->startVerse);
            $ev = BibleVerse::verse($this->book, $this->endChapter, $this->endVerse);
            $passageVerses = BibleVerse::model()->findAllByPk(range($sv->verse_id, $ev->verse_id));
            $verses = array();
            foreach ($passageVerses as $verse) {
                $verses[$verse->chapter . ":" . $verse->verse] = $verse->verse_text;
            }
            return $verses;
         } else {
             return ucfirst($this->passage);
         }
     }

    /**
     * Validation rules for the form
     */
    public function rules() {
        return array(
            //array('passage', 'required'),
            array('passage', 'validatePassage'),
            //array('book', 'required'),
            array('book', 'validateBook'),
            array('startChapter,startVerse,endChapter,endVerse', 'numerical'),
            array('startChapter,endChapter', 'validateChapterInBook'),
            array('endChapter', 'validateStartChapterSpecified'),
            array('startVerse,endVerse', 'validateChapterSpecified'),
            array('startVerse,endVerse', 'validateVerseInChapter'),
            array('endVerse', 'validateEndVerseAfterStartVerse'),
        );
    }

    /**
     * Validation rule to make sure entered passage matches regular expression
     * @param string $attribute
     * @param array $params
     */
    public function validatePassage($attribute, $params) {
        if ($this->passage != null) {
            $matchesArray = array();
            $match = preg_match($this->passageRegEx, $this->passage, $matchesArray);
            if ($match) {
                $this->passage = $matchesArray[0]; // the portion that matched
                $this->book = $matchesArray['book'];
                $this->startChapter = isset($matchesArray['start_chapter']) ? $matchesArray['start_chapter'] : null;
                $this->startVerse = isset($matchesArray['start_verse']) ? $matchesArray['start_verse'] : null;
                $this->endChapter = isset($matchesArray['end_chp_or_verse']) ? $matchesArray['end_chp_or_verse'] : null;
                $this->endVerse = isset($matchesArray['end_verse']) ? $matchesArray['end_verse'] : null;

                if (!$this->endChapter && !$this->endVerse) {
                    // e.g. John 1:2 => John 1:2-1:2
                    $this->endChapter = $this->startChapter;
                    $this->endVerse = $this->startVerse;
                } else if (!$this->endVerse && $this->startVerse) {
                    // e.g. John 1:2-4 => John 1:2-1:4
                    $this->endVerse = $matchesArray['end_chp_or_verse'];
                    $this->endChapter = $this->startChapter;
                }
            } else {
                $this->addError($attribute, $attribute . ' is invalid (does not match regex).');
            }
        }
    }

    /**
     * Validate that the parsed book name is a valid book
     * or a valid abbrev. for a book. If valid, set $this->book to be the full
     * book name.
     * @param <string> $attribute; expected to be "book"
     * @param <array> $params
     */
    public function validateBook($attribute, $params) {
        if ($this->book != null)
        {
            $wholeBook = BibleVerse::isBookValid($this->book);
            if ($wholeBook)
                $this->book = $wholeBook;
            else
                $this->addError($attribute, $this->book . ' is not a valid book.');
        }
    }

    /**
     * Validation rule to check that chapter exists in book
     * @param $attribute, chapter number
     * @param $params, array containing the book name
     */
    public function validateChapterInBook($attribute, $params) {

        if ($attribute == 'startChapter')
            $chapter = (int) $this->startChapter;
        else
            $chapter = (int) $this->endChapter;

        // if the chapter was not specified, then don't validate
        if ($chapter && count($this->getErrors('book')) == 0) {
            $criteria = new CDbCriteria(array(
                        'condition' => 'book = :book AND chapter = :chapter',
                        'params' => array(':book' => $this->book, ':chapter' => $chapter),
                        'limit' => 1
                    ));

            if (BibleVerse::model()->count($criteria) < 1)
                $this->addError($attribute, $attribute . ' is invalid: ' . $chapter);
        }
    }

    /**
     * Validation rule for ensuring that startChapter is specified if endChapter
     * is specified, and that endChapter is >= startChapter
     */
    public function validateStartChapterSpecified($attribute, $params) {
        // was endChapter specified?
        if ($this->endChapter != null && $this->endChapter > 0) {
            if ($this->startChapter == null || $this->startChapter < 1)
                $this->addError(
                        'startChapter',
                        'If end chapter is specified, start chapter must also be specified.'
                );
            else if ($this->endChapter < $this->startChapter) {
                $this->addError(
                        'endChapter',
                        'End chapter must be >= start chapter.'
                );
            }
        }
    }

    /**
     * Validation rule for ensuring that chapter is specified if a verse is.
     */
    public function validateChapterSpecified($attribute, $params) {
        if ($attribute == 'startVerse') {
            $verse = $this->startVerse;
            $chapter = $this->startChapter;
        } else {
            $verse = $this->endVerse;
            $chapter = $this->endChapter;
        }

        if ($verse != null && ($chapter == null || $chapter < 1))
            $this->addError($attribute, 'Please specify chapter or leave verse blank.');
    }

    /**
     * Validation rule to ensure end verse >= start verse if in same chapter
     */
    public function validateEndVerseAfterStartVerse($attribute, $params) {
        if ($this->endVerse != null && $this->startChapter == $this->endChapter) {
            if ($this->endVerse < $this->startVerse)
                $this->addError(
                        'endVerse',
                        'End verse must be on or after start verse.'
                );
        }
    }

    public function validateVerseInChapter($attribute, $params) {
        if ($attribute == 'startVerse') {
            $chapter = (int) $this->startChapter;
            $verse = (int) $this->startVerse;
        } else {
            $chapter = (int) $this->endChapter;
            $verse = (int) $this->endVerse;
        }
        
        // if the chapter was not specified, then don't validate
        if ($chapter && $verse && count($this->getErrors('startChapter')) == 0 && count($this->getErrors('endChapter')) == 0) {
            $criteria = new CDbCriteria(array(
                        'condition' => 'book = :book AND chapter = :chapter AND verse = :verse',
                        'params' => array(':book' => $this->book, ':chapter' => $chapter,':verse' => $verse),
                        'limit' => 1
                    ));

            if (BibleVerse::model()->count($criteria) < 1)
                $this->addError($attribute, $attribute . ' is invalid: ' . $verse);
        }
    }

}

?>
