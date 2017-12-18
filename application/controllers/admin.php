<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Admin extends CI_Controller {
	
	public function __construct ()
	{
		parent::__construct();
		$this->load->model('model_products');
		$this->load->model('model_users');
		$this->load->model('model_settings');
	}
		
	public function index()
	{	
		echo "test";
		$data['products'] = $this->model_products->all_products();	
		$data['get_sitename'] = $this->model_settings->sitename_settings();
		$data['get_footer'] = $this->model_settings->footer_settings();
		//print_r($data);
		$this->load->view('backend/dashboard',$data);
	}



	
}