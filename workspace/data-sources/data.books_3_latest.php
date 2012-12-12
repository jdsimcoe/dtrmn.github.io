<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcebooks_3_latest extends SectionDatasource{

		public $dsParamROOTELEMENT = 'books-3-latest';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '3';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'system:id';
		public $dsParamHTMLENCODE = 'yes';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		

		public $dsParamFILTERS = array(
				'45' => 'no',
				'54' => 'no',
		);
		

		public $dsParamINCLUDEDELEMENTS = array(
				'title',
				'author: name',
				'synopsis: formatted',
				'synopsis: unformatted',
				'review: formatted',
				'review: unformatted',
				'date',
				'image: image',
				'image: caption',
				'rating'
		);
		

		public function __construct($env=NULL, $process_params=true){
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'Books: 3 Latest',
				'author' => array(
					'name' => 'Jonathan Simcoe',
					'website' => 'http://dtrmn',
					'email' => 'jdsimcoe@gmail.com'),
				'version' => 'Symphony 2.3.1',
				'release-date' => '2012-12-09T00:34:22+00:00'
			);
		}

		public function getSource(){
			return '9';
		}

		public function allowEditorToParse(){
			return true;
		}

	}
