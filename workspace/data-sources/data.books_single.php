<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcebooks_single extends SectionDatasource{

		public $dsParamROOTELEMENT = 'books-single';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'no';
		public $dsParamLIMIT = '1';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamREQUIREDPARAM = '$title';
		public $dsParamSORT = 'system:id';
		public $dsParamHTMLENCODE = 'yes';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		

		public $dsParamFILTERS = array(
				'41' => '{$title}',
		);
		

		public $dsParamINCLUDEDELEMENTS = array(
				'title',
				'author: name',
				'author: link',
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
				'name' => 'Books: Single',
				'author' => array(
					'name' => 'Jonathan Simcoe',
					'website' => 'http://dtrmn',
					'email' => 'jdsimcoe@gmail.com'),
				'version' => 'Symphony 2.3.1',
				'release-date' => '2012-12-09T00:37:26+00:00'
			);
		}

		public function getSource(){
			return '9';
		}

		public function allowEditorToParse(){
			return true;
		}

	}
