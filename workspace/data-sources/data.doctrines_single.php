<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcedoctrines_single extends SectionDatasource{

		public $dsParamROOTELEMENT = 'doctrines-single';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '1';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamREQUIREDPARAM = '$title';
		public $dsParamPARAMOUTPUT = array(
				'verse'
		);
		public $dsParamSORT = 'system:id';
		public $dsParamHTMLENCODE = 'yes';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		

		public $dsParamFILTERS = array(
				'10' => '{$title}',
		);
		

		public $dsParamINCLUDEDELEMENTS = array(
				'title',
				'author: name',
				'author: image: image',
				'date',
				'summary: formatted',
				'content: formatted',
				'verse: passage',
				'books: title',
				'books: image: image'
		);
		

		public function __construct($env=NULL, $process_params=true){
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'Doctrines: Single',
				'author' => array(
					'name' => 'Jonathan Simcoe',
					'website' => 'http://dtrmn',
					'email' => 'jdsimcoe@gmail.com'),
				'version' => 'Symphony 2.3.1',
				'release-date' => '2013-03-12T18:31:02+00:00'
			);
		}

		public function getSource(){
			return '4';
		}

		public function allowEditorToParse(){
			return true;
		}

	}
