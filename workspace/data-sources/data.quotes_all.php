<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcequotes_all extends SectionDatasource{

		public $dsParamROOTELEMENT = 'quotes-all';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'no';
		public $dsParamLIMIT = '20';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'date';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		

		public $dsParamFILTERS = array(
				'23' => 'no',
		);
		

		public $dsParamINCLUDEDELEMENTS = array(
				'title',
				'date',
				'quote: unformatted',
				'book: image: image',
				'image: image'
		);
		

		public function __construct($env=NULL, $process_params=true){
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'Quotes: All',
				'author' => array(
					'name' => 'Jonathan Simcoe',
					'website' => 'http://dtrmn',
					'email' => 'jdsimcoe@gmail.com'),
				'version' => 'Symphony 2.3.1',
				'release-date' => '2013-04-03T20:55:36+00:00'
			);
		}

		public function getSource(){
			return '3';
		}

		public function allowEditorToParse(){
			return true;
		}

	}
