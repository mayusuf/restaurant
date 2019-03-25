<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    private $apiurl = "http://localhost:8000/api/v1/";    

    public function __construct(){

    	
    }

    public function index(){

    	//return view('welcome');
    	
    }

    public function apirequest($url,$post=false,$data = NULL){

    	$curl = curl_init();
    	

    	//print_r($data);
    	// exit();

    	if($post){
    		//print_r($data);
			curl_setopt_array($curl, array(	    
		    	CURLOPT_URL => $this->apiurl.$url,
		    	CURLOPT_RETURNTRANSFER => true,
		    	CURLOPT_ENCODING => "",
		    	CURLOPT_MAXREDIRS => 10,
		    	CURLOPT_TIMEOUT => 30000,											
			    CURLOPT_CUSTOMREQUEST => "POST",
			    CURLOPT_POSTFIELDS => json_encode($data),
		    	CURLOPT_HTTPHEADER => array(
			    	// Set here requred headers
			        "accept: application/json",
			        "accept-language: en-US,en;q=0.8",
			        "content-type: application/json",
		    	),
			));

		}else{
			
			curl_setopt_array($curl, array(	    
		    	CURLOPT_URL => $this->apiurl.$url,
		    	CURLOPT_RETURNTRANSFER => true,
		    	CURLOPT_ENCODING => "",
		    	CURLOPT_MAXREDIRS => 10,
		    	CURLOPT_TIMEOUT => 30000,											
			    CURLOPT_HTTPHEADER => array(
			    	// Set here requred headers
			        "accept: application/json",
			        "accept-language: en-US,en;q=0.8",
			        "content-type: application/json",
		    	),
			));

		}
		
		$response = curl_exec($curl);
		$err = curl_error($curl);

		curl_close($curl);

		if ($err) {
		    echo "cURL Error #:" . $err;
		} else {
		    return $response;
		}
    }
}
