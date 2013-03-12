<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceinspiration_all extends SectionDatasource{

		public $dsParamROOTELEMENT = 'inspiration-all';
		public $dsParamORDER = 'random';
		public $dsParamPAGINATERESULTS = 'no';
		public $dsParamLIMIT = '20';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'system:id';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		

		public $dsParamFILTERS = array(
				'31' => 'no',
		);
		

		public $dsParamINCLUDEDELEMENTS = array(
				'cite: name',
				'content: formatted'
		);
		

		public function __construct($env=NULL, $process_params=true){
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'Inspiration: All',
				'author' => array(
					'name' => 'Jonathan Simcoe',
					'website' => 'http://dtrmn',
					'email' => 'jdsimcoe@gmail.com'),
				'version' => 'Symphony 2.3.1',
				'release-date' => '2013-03-12T16:29:27+00:00'
			);
		}

		public function getSource(){
			return '7';
		}

		public function allowEditorToParse(){
			return true;
		}

	}
