<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcecrossway_esv extends DynamicXMLDatasource{

		public $dsParamROOTELEMENT = 'crossway-esv';
		public $dsParamURL = 'http://www.esvapi.org/v2/rest/passageQuery?key=IP&output-format=crossway-xml-1.0&include-quote-entities=true&include-line-breaks=false&include-simple-entities=true&passage={$ds-verses-single}';
		public $dsParamXPATH = '/crossway-bible/passage/content/verse-unit';
		public $dsParamCACHE = '999999';
		public $dsParamTIMEOUT = '6';
		

		

		

		public function __construct($env=NULL, $process_params=true){
			parent::__construct($env, $process_params);
			$this->_dependencies = array('$ds-verses-single');
		}

		public function about(){
			return array(
				'name' => 'Crossway: ESV',
				'author' => array(
					'name' => 'Jonathan Simcoe',
					'website' => 'http://dtrmn',
					'email' => 'jdsimcoe@gmail.com'),
				'version' => 'Symphony 2.3.1',
				'release-date' => '2012-11-21T18:23:29+00:00'
			);
		}

		public function getSource(){
			return 'dynamic_xml';
		}

		public function allowEditorToParse(){
			return true;
		}

	}
