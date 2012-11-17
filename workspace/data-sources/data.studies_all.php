<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcestudies_all extends SectionDatasource{

		public $dsParamROOTELEMENT = 'studies-all';
		public $dsParamORDER = 'asc';
		public $dsParamPAGINATERESULTS = 'no';
		public $dsParamLIMIT = '20';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'date';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		public $dsParamCACHE = '3600';
		

		public $dsParamFILTERS = array(
				'35' => 'no',
				'25' => 'no',
		);
		

		public $dsParamINCLUDEDELEMENTS = array(
				'title',
				'date',
				'doctrine: title',
				'recap: formatted',
				'upcoming'
		);
		

		public function __construct($env=NULL, $process_params=true){
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'Studies: All',
				'author' => array(
					'name' => 'Jonathan Simcoe',
					'website' => 'http://dtrmn',
					'email' => 'jdsimcoe@gmail.com'),
				'version' => 'Symphony 2.3.1',
				'release-date' => '2012-11-17T22:22:55+00:00'
			);
		}

		public function getSource(){
			return '5';
		}

		public function allowEditorToParse(){
			return true;
		}

	}
