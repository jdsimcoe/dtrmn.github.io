<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcebooks_all extends SectionDatasource{

		public $dsParamROOTELEMENT = 'books-all';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'no';
		public $dsParamLIMIT = '100';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'date';
		public $dsParamHTMLENCODE = 'yes';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		public $dsParamCACHE = '0';
		

		public $dsParamFILTERS = array(
				'45' => 'no',
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
				'rating',
				'reading'
		);
		

		public function __construct($env=NULL, $process_params=true){
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'Books: All',
				'author' => array(
					'name' => 'Jonathan Simcoe',
					'website' => 'http://dtr.mn',
					'email' => 'jdsimcoe@gmail.com'),
				'version' => 'Symphony 2.3.1',
				'release-date' => '2012-12-29T15:21:47+00:00'
			);
		}

		public function getSource(){
			return '9';
		}

		public function allowEditorToParse(){
			return true;
		}

	}
