<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class MenuController extends Controller
{
    private $inputs;
    private $result;
    
    protected $email = "yusuf@gmail.com";
    protected $pass = "0104039";

    public function __construct(){
   	
    }

    public function index(){

        if(session('api_token')==''){
    	   
           $this->inputs = ["email" => $this->email, "password" => $this->pass];
           //print_r($this->inputs);
    	   $this->result = json_decode($this->apirequest('login',true,$this->inputs),true);

    	   session(['api_token' => $this->result['user']['api_token']]);

        }
             //echo  session('api_token'); exit();

            $this->result = json_decode($this->apirequest('getmenu/'.session('api_token')),true);
        
            //print_r($this->result); exit();

        return view('welcome')->with(['corns'=>$this->result]);

    	//echo session('api_token');
    }

    public function menuitem(Request $request){

        //echo $request->all()['item_name'];

        $this->inputs = ["api_token" => session('api_token'),"item_name" => $request->all()['item_name'],"item_desc" => $request->all()['item_desc'],"category" => $request->all()['category']];
        //print_r($this->inputs);
        $this->result = json_decode($this->apirequest('menuitems',true,$this->inputs),true);

        //print_r($this->result); exit();

        return view('welcome')->with(['corns'=>$this->result]);

    }
}
