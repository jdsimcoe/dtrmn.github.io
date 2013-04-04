<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcequotes_single extends SectionDatasource{

		public $dsParamROOTELEMENT = 'quotes-single';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '1';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamREQUIREDPARAM = '$title';
		public $dsParamSORT = 'system:id';
		public $dsParamHTMLENCODE = 'yes';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		

		public $dsParamFILTERS = array(
				'33' => '{$title}',
		);
		

		public $dsParamINCLUDEDELEMENTS = array(
				'title',
				'date',
				'quote: formatted',
				'book: title',
				'book: author: name',
				'book: image: image',
				'image: image',
				'author: name',
				'source',
				'link',
				'commentary: formatted'
		);
		

		public function __construct($env=NULL, $process_params=true){
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'Quotes: Single',
				'author' => array(
					'name' => 'Jonathan Simcoe',
					'website' => 'http://dtrmn',
					'email' => 'jdsimcoe@gmail.com'),
				'version' => 'Symphony 2.3.1',
				'release-date' => '2013-04-03T20:55:51+00:00'
			);
		}

		public function getSource(){
			return '3';
		}

		public function allowEditorToParse(){
			return true;
		}

	}
