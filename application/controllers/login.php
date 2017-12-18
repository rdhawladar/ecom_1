<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends CI_Controller {
		
	public function index()
	{
		
		$this->load->model('model_settings');
		$this->form_validation->set_rules('username','Username','required|alpha_numeric');
		$this->form_validation->set_rules('password','Password','required|alpha_numeric|md5');



		if($this->form_validation->run()	==	FALSE)
		{
			$data['get_sitename'] = $this->model_settings->sitename_settings();
			$data['get_footer']   = $this->model_settings->footer_settings();	
			$this->load->view('login/form_login',$data); 
			//redirect("admin/products");	
		}else{
			//print_r($this->input->post);
					
			$username = set_value('username');	
			$password = set_value('password');	
		
			$this->load->model('model_users');	
			$valid_user	= $this->model_users->check_usr($username,$password);
			$check_user_is_active = $this->model_users->check_user_is_active($username,$password);
			//print_r($check_user_is_active);

//echo count($valid_user);
//echo count($check_user_is_active);

			//echo $valid_user->usr_group;
			
			if( count($valid_user)	>	0){


                $flag = $valid_user->usr_group;
				
				 //echo 12345;
				 //print_r($valid_user);
				
				
				if($flag>0){
					$this->session->set_userdata('username',$username);
				$this->session->set_userdata('group',$flag);
 					// echo base_url("/admin/products");
 					 redirect( "http://localhost/ecom_1/index.php/admin");
				}else{
					echo "not found";

				}	


				/*switch($flag)
				{
					case 1 ://for admin
						redirect('admin/products');
						break;
					
					case 2 ://for c-admin
						redirect('admin/products');
						break;
					
					case 3 ://for member
						redirect(base_url());
						break;
					
					default: 
						break;
				}*/
			}
			else
			{
				if ( count($check_user_is_active) == 0)
				{
						$this->session->set_flashdata('error','Username / Password Not Correct !' );
				}else{
						$this->session->set_flashdata('error','Sorry this account is not active !' );
				}
				//redirect('login');
				 
				
			}//end if valid_user 
			 


		}//end if validation
		
		
		
		
	}
	
	public function my_home(){
		echo "message";
	}
	public function logout()
	{
		$this->session->sess_destroy();
		redirect('login');
	}
	
		
	
	
}
