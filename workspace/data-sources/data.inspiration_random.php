<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceinspiration_random extends SectionDatasource{

		public $dsParamROOTELEMENT = 'inspiration-random';
		public $dsParamORDER = 'random';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '1';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'system:id';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		public $dsParamCACHE = '0';
		

		public $dsParamFILTERS = array(
				'31' => 'no',
		);
		

		public $dsParamINCLUDEDELEMENTS = array(
				'title',
				'content: formatted',
				'cite'
		);
		

		public function __construct($env=NULL, $process_params=true){
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'Inspiration: Random',
				'author' => array(
					'name' => 'Jonathan Simcoe',
					'website' => 'http://dtr.mn',
					'email' => 'jdsimcoe@gmail.com'),
				'version' => 'Symphony 2.3.1',
				'release-date' => '2012-12-08T17:19:48+00:00'
			);
		}

		public function getSource(){
			return '7';
		}

		public function allowEditorToParse(){
			return true;
		}

	}
