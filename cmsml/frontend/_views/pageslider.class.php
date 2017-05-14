<?php
/**
* Die Klasse erzeugt eine Navigationsleiste zum Bl�ttern innerhalb einer Liste 
*
* @param   integer  $rowsperpage  Zeilen pro Seite
* @param   integer  $totalrows    Total Zeilen (entspr. Datens�tzen)
* @param   integer  $startrow     Startrow der aktuellen Seite
* @return  string   $slider       Blaettern-Links / Navigation
* @author      Roland Hempen
* @copyright   Frei einsetzbar mit Autor-Angabe
* @version     1.0 | 2007-03-06
*/ 

class pageSlider
{
	/* Attributes */
	private $mActPage;
	private $gifs				= GIFS_PAGESLIDER;
	private $mTotalPages;
    private $mTotalRows;
	private $mRowsPerPage;
    private $mStartRow;

	/* Konstruktor */
	function __construct($rowsperpage, $totalrows, $startrow) 
	{
		//var_dump($rowsperpage."/".$totalrows."/".$startrow);
   		$this->mRowsPerPage 	= $rowsperpage;
        $this->mTotalRows   	= $totalrows;
        $this->mStartRow    	= $startrow;
        $this->mTotalPages  	= $this->anzPages();
        $this->mActPage     	= $this->actPage();
		$this->mBlindGif 		= '<img src="'.GIFS_PAGESLIDER.'blank.gif" alt="" border="0" width="14" height="1" />';
		$this->mFirstActive 	= '<img src="'.GIFS_PAGESLIDER.'page_first.gif" border="0" width="14" height="11" />';
		$this->mPrevActive		= '<img src="'.GIFS_PAGESLIDER.'page_prev.gif" border="0" width="14" height="11" />';
		$this->mNextActive 		= '<img src="'.GIFS_PAGESLIDER.'page_next.gif" border="0" width="14" height="11" />';
		$this->mLastActive 		= '<img src="'.GIFS_PAGESLIDER.'page_last.gif" border="0" width="14" height="11" />';
		$this->mFirstInactive 	= '<img src="'.GIFS_PAGESLIDER.'page_first_inactive.gif" border="0" width="14" height="11" />';
		$this->mPrevInactive	= '<img src="'.GIFS_PAGESLIDER.'page_prev_inactive.gif" border="0" width="14" height="11" />';
		$this->mNextInactive 	= '<img src="'.GIFS_PAGESLIDER.'page_next_inactive.gif" border="0" width="14" height="11" />';
		$this->mLastInactive 	= '<img src="'.GIFS_PAGESLIDER.'page_last_inactive.gif" border="0" width="14" height="11" />';        
	}

    /** Berechnung der Anzahl Seiten
     * 1. ergibt sich aus Anzahl Rows / Rows pro Seite
     * 2. Ist der Quotient nicht 0 muss noch eine Seite mehr dazugez�hlt werden,
     *    da die letzten Rows keine ganze Seite fuellen
    */	
    private function anzPages() 
    {
        if ($this->mTotalRows > $this->mRowsPerPage) {
                $pages = intval($this->mTotalRows / $this->mRowsPerPage);
                if ($this->mTotalRows % $this->mRowsPerPage > 0) // modulo
                {
                    $pages++;
                }
        } else { $pages = 1; }
        return $pages;         
    }
        
	/** Berechnen der aktuellen Seite anhand des Startrows
	 * 1. ist das Ergebnis von startrow / rowsperpage <= 0 sind wir auf der Seite 1,
	 * 2. ist das Ergebnis <= 1 muss die Seitenzahl um 1 erhoeht werden
	 *    da ja der Rowzaehler bei 0 beginnt.
	 * 3. wenn der Quotient nicht 0 ergibt muss der Seitenzaehler ebenfalls um 1 erhoeht werden,
	 *    da dann noch Rows kommen, die nicht eine ganze Seite f�llen
	*/    
    private function actPage() 
    {
        $actpage = intval($this->mStartRow / $this->mRowsPerPage);
        if ($actpage <= 0) {
                $actpage = 1;
        }
        else if ($actpage >= 1) { $actpage++; }
        
        if ($this->mStartRow % $this->mRowsPerPage > 0) {
                $actpage++;
        }
        return $actpage;        
    }

	/** GET-Parameter zusammensetzen, um sie dann an den Link zu uebergeben
	 *	@param:  $_REQUEST()
	 *	@return: $params - '?kap=$_REQUEST['kap']&ukap=$_REQUEST['ukap']&pageid=$_REQUEST['page_id']'
    */    
    private function setParams() {
        $params = '';
        if (isset($_REQUEST['navid']) && $_REQUEST['navid'] != '') { $params = '?navid=' . intval($_REQUEST['navid']); }
        if (isset($_REQUEST['subid']) && $_REQUEST['subid'] != '') { $params .= '&subid=' . intval($_REQUEST['subid']); }
        if (isset($_REQUEST['pagid']) && $_REQUEST['pagid'] > 0)   { $params .= '&pagid=' . intval($_REQUEST['pagid']); }
        if ($params == '') { $params = '?';} else { $params .= '&';}
        return $params;        
    }

	/** Die Navigation berechnen und in HTML verpacken
	 * 1. Wenn der Startrow > 0 ist, sind wir mindestens auf Seite 2. (Seite 1 hat ja den Startrow = 0)
	 *    Eine Seite zur�ckzubl�ttern: (Actpage -2) * Rows pro Seite = $prev_page
	 *    Wenn der Startrow <= 0 --> Navigation First und Prev ausblenden
	 * 2. Startrow f�r Page_next ergibt sich aus ActPage * RowsPerPage
	 *    wenn der Startrow < Totalrows ist: Navigation f�r Next und Last einblenden
	 *    wenn der Startrow > Totalrows wird: Navigation f�r next und last ausblenden
	*/
    public function toHtml() 
    {
        global $redirect; 
		$params = $redirect->set_link($_GET['pagid']);
		if (SMURL == 'ja') {
			$params .= '/';
		} else {
			if ($params == '') { $params = '?';} else { $params .= '&'; }	
		}
                
		if ($this->mStartRow > 0) {
		$start = ($this->mActPage - 2) * $this->mRowsPerPage;
        if ($start < 1) { $start = 0; }
            $href = $params.$redirect->set_start(0);
			$first_page = '<a title="'.$GLOBALS['GALERIE']['FIRST_PAGE'].'" href="'.$params.$redirect->set_start(0).'">'.$this->mFirstActive.'</a>';
			$prev_page  = '<a title="'.$GLOBALS['GALERIE']['PREV_PAGE'].'" href="'.$params.$redirect->set_start($start).'">'.$this->mPrevActive.'</a>';
		} else {
			$first_page = $this->mFirstInactive;
			$prev_page  = $this->mPrevInactive;
        }
        
        $start = intval($this->mActPage * $this->mRowsPerPage);
		if ($start < $this->mTotalRows) {
			$next_page  = '<a title="'.$GLOBALS['GALERIE']['NEXT_PAGE'].'" href="'.$params.$redirect->set_start($start).'">'.$this->mNextActive.'</a>';
            $start 		= $this->mTotalRows - $this->mRowsPerPage;
			$last_page  = '<a title="'.$GLOBALS['GALERIE']['LAST_PAGE'].'" href="'.$params.$redirect->set_start($start).'">'.$this->mLastActive.'</a>';
		} else {
			$next_page  = $this->mNextInactive;
			$last_page  = $this->mLastInactive;
		}
 				
		$slider = '';
		// der pageSlider wird nur angezeigt, wenn mehr als eine Seite angezeigt werden k�nnen		
		if ($this->mTotalPages > 1) {
		// first-page und last-page werden nur angezeigt, wenn mehr als 2 Seiten berechnet wurden
		if ($this->mTotalPages > 2)	{ $slider  = $first_page . "\n"; }
		$slider .= $prev_page . "\n";
		$slider .= '<span class="slider">' .$this->mActPage.'</span><span> / '.$this->mTotalPages."</span>\n";
		$slider .= $next_page . "\n";
		if ($this->mTotalPages > 2) { $slider .= $last_page . "\n"; }		
	}		
		return $slider;
	}
}

?>
