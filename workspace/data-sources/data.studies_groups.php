<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcestudies_groups extends SectionDatasource{

		public $dsParamROOTELEMENT = 'studies-groups';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'no';
		public $dsParamLIMIT = '20';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'system:id';
		public $dsParamHTMLENCODE = 'yes';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		

		public $dsParamFILTERS = array(
				'70' => 'no',
		);
		

		public $dsParamINCLUDEDELEMENTS = array(
				'title',
				'description: formatted',
				'image: image',
				'image: caption',
				'studies: title',
				'studies: date',
				'studies: doctrine: title',
				'studies: upcoming',
				'studies: hide',
				'active'
		);
		

		public function __construct($env=NULL, $process_params=true){
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'Studies: Groups',
				'author' => array(
					'name' => 'Jonathan Simcoe',
					'website' => 'http://dtrmn',
					'email' => 'jdsimcoe@gmail.com'),
				'version' => 'Symphony 2.3.1',
				'release-date' => '2013-02-15T16:33:23+00:00'
			);
		}

		public function getSource(){
			return '12';
		}

		public function allowEditorToParse(){
			return true;
		}

	}
