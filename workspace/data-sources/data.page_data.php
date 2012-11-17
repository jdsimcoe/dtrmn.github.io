<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcepage_data extends SectionDatasource{

		public $dsParamROOTELEMENT = 'page-data';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'no';
		public $dsParamLIMIT = '20';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'system:id';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		public $dsParamCACHE = '3600';
		

		public $dsParamFILTERS = array(
				'28' => '{$current-page}',
		);
		

		public $dsParamINCLUDEDELEMENTS = array(
				'title',
				'description: formatted',
				'page',
				'image: image',
				'image: url',
				'image: caption'
		);
		

		public function __construct($env=NULL, $process_params=true){
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'Page: Data',
				'author' => array(
					'name' => 'Jonathan Simcoe',
					'website' => 'http://dtrmn',
					'email' => 'jdsimcoe@gmail.com'),
				'version' => 'Symphony 2.3.1',
				'release-date' => '2012-11-17T22:22:25+00:00'
			);
		}

		public function getSource(){
			return '6';
		}

		public function allowEditorToParse(){
			return true;
		}

	}
