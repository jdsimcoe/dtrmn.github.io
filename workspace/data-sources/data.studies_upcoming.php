<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcestudies_upcoming extends SectionDatasource{

		public $dsParamROOTELEMENT = 'studies-upcoming';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '1';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'date';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		

		public $dsParamFILTERS = array(
				'35' => 'yes',
		);
		

		public $dsParamINCLUDEDELEMENTS = array(
				'date'
		);
		

		public function __construct($env=NULL, $process_params=true){
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'Studies: Upcoming',
				'author' => array(
					'name' => 'Jonathan Simcoe',
					'website' => 'http://dtrmn',
					'email' => 'jdsimcoe@gmail.com'),
				'version' => 'Symphony 2.3.1',
				'release-date' => '2012-11-17T21:31:56+00:00'
			);
		}

		public function getSource(){
			return '5';
		}

		public function allowEditorToParse(){
			return true;
		}

	}
