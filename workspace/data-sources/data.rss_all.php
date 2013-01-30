<?php

	require_once(EXTENSIONS . '/uniondatasource/data-sources/datasource.union.php');

	Class datasourcerss_all extends UnionDatasource{

		public $dsParamROOTELEMENT = 'rss-all';
		public $dsParamPAGINATERESULTS = 'no';
		public $dsParamSTARTPAGE = '';
		public $dsParamLIMIT = '';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamREQUIREDPARAM = '';

		public $dsParamUNION = array(
			'articles-all',
			'doctrines-all',
			'quotes-all',
		);
		

		public $dsParamINCLUDEDELEMENTS = array(
			'system:pagination'
		);

		public function __construct($env=NULL, $process_params=true){
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'RSS: All',
				'author' => array(
					'name' => 'Jonathan Simcoe',
					'website' => 'http://dtrmn',
					'email' => 'jdsimcoe@gmail.com'),
				'version' => 'Union Datasource Symphony 2.3.1',
				'release-date' => '2013-01-30T00:53:53+00:00'
			);
		}

		public function allowEditorToParse(){
			return true;
		}

	}
