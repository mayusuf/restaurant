<?php

namespace App\Http\Controllers;
use GuzzleHttp\Exception\GuzzleException;
use Goutte\Client;
use GuzzleHttp\Client as GuzzleClient;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;


class crawlController extends Controller
{
    private $url_amano = "http://www.amano-ristorante.de/speisen/?lang=en";
    private $url_bar61 = "http://www.bar61.com/starters/";

    public function __construct(){

    }

    public function docrawl_amano(){

    	// for update. First delete all the records then insert 
		$rest_id = json_decode(DB::table('restaurants')->select('res_id')->where('res_name', '=','Ristorante a Mano')->get())[0]->res_id;
		

		if($rest_id){

			DB::table('restaurants')->where('res_id', $rest_id)->delete();

			DB::table('menu_items')->where('res_id', $rest_id)->delete();
	    }

		//Restaurant name and address
    	$client = new Client();
		
		$crawler = $client->request('GET', 'http://www.amano-ristorante.de/kontakt/?lang=en');

		$goutteClient = new Client();
		
		$guzzleClient = new GuzzleClient(array(
		    'timeout' => 60,
		));

		$goutteClient->setClient($guzzleClient);

		$address = $crawler->filter('.fw-special-subtitle');
		
		foreach ($address as $item) {

			if($item->textContent != 'Questions & suggestions')
				$contact[] = $item->textContent;
		}

		//print_r($contact);

		$insert_id = DB::table('restaurants')->insertGetId(
    		['res_name' => 'Ristorante a Mano', 'res_address' => $contact[0],'res_desc'=>"Phone: ".$contact[2]." Open: ".$contact[1],'url'=>'http://www.amano-ristorante.de']
		);

		//exit();

		//echo "<br/><br/>";

		$client1 = new Client();
		
		$crawler1 = $client1->request('GET', 'http://www.amano-ristorante.de/speisen/?lang=en');

		$goutteClient1 = new Client();
		
		$guzzleClient1 = new GuzzleClient(array(
		    'timeout' => 60,
		));

		$goutteClient1->setClient($guzzleClient1);

		//Menu name
		$items = $crawler1->filter('.fw-col-inner h4.fw-special-title');

		foreach ($items as $item) {

			$menu_item[] = $item->textContent;
		}

		
		//echo "<br/><br/>";

		// price per menu
		$prices = $crawler1->filter('.fw-col-inner .fw-heading .fw-special-subtitle');

		foreach ($prices as $item) {

		    if(preg_match('/[0-9]+.[0-9]+/', $item->textContent,$array))
		    	//print_r($array); echo "<br/>";
		    	$menu_price[] = $array[0];
		}   

		// print_r($menu_price);
		// exit();

		//echo "<br/><br/>";

		// Description 
		$desc = $crawler1->filter('.fw-text-inner p');

		foreach ($desc as $item) {
			$menu_desc[] = $item->textContent;
		}

		//print_r($menu_desc);

		for($i=0; $i<count($menu_item);$i++){

			DB::table('menu_items')->insert(
    		['item_name' => $menu_item[$i], 'item_desc' => $menu_desc[$i],'item_price'=>$menu_price[$i],'res_id'=>$insert_id,'cat_id'=>1]
		);

		}

		echo "Successfully Inserted";
	}

	public function docrawl_bar61(){

		// for update. First delete all the records then insert 
		$rest_id = json_decode(DB::table('restaurants')->select('res_id')->where('res_name', '=','Bar61')->get())[0]->res_id;
		

		if($rest_id){

			DB::table('restaurants')->where('res_id', $rest_id)->delete();

			DB::table('menu_items')->where('res_id', $rest_id)->delete();
	    }

		$client = new Client();
		
		$crawler = $client->request('GET', 'http://www.bar61.com/contact-1/');

		$goutteClient = new Client();
		
		$guzzleClient = new GuzzleClient(array(
		    'timeout' => 60,
		));

		$goutteClient->setClient($guzzleClient);

		$address = $crawler->filter('.mkdf-icon-list-item p');
		
		foreach ($address as $item) {

			$contact[] = $item->textContent;
		}

		//print_r($contact);

		$insert_id = DB::table('restaurants')->insertGetId(
    		['res_name' => 'Bar61', 'res_address' => $contact[0],'res_desc'=>"Phone: ".$contact[1]." Email: ".$contact[2],'url'=>'http://www.bar61.com/']
		);

		

		//echo "<br/><br/>";

		
		
		$res_url = array('http://www.bar61.com/starters/','http://www.bar61.com/chicken-specialities/');

		foreach ($res_url as $value) {

			//echo $value; 	

			$client1 = new Client();

			$crawler1 = $client1->request('GET', $value);
			//$crawler1 = $client1->request('GET', );
			
			$goutteClient1 = new Client();
			
			$guzzleClient1 = new GuzzleClient(array(
			    'timeout' => 60,
			));

			$goutteClient1->setClient($guzzleClient1);

			//Menu name

			$items = $crawler1->filter('.mkdf-ml-item-content h4.mkdf-ml-title a');

			foreach ($items as $item) {

				$menu_item[] = $item->textContent;
			}

			// print_r($menu_item);
			// echo "<br/><br/>";

			// price per menu
			$prices = $crawler1->filter('.mkdf-ml-price-holder h4.mkdf-ml-price');

			foreach ($prices as $item) {

			    if(preg_match('/[0-9]+.[0-9]+/', $item->textContent,$array))		    	
			    	$menu_price[] = $array[0];
			}   

			//print_r($menu_price);
			// exit();

			//echo "<br/><br/>";

			// Description 
			$desc = $crawler1->filter('.mkdf-ml-excerpt-holder');
			//print_r($desc);

			foreach ($desc as $item) {

				if($item->textContent)
					$menu_desc[] = $item->textContent;
				else 
					$menu_desc[] = ' ';
			}

			//print_r($menu_desc);
		
		}

		for($i=0; $i<count($menu_item);$i++){

				DB::table('menu_items')->insert(
	    		['item_name' => $menu_item[$i], 'item_desc' => $menu_desc[$i],'item_price'=>$menu_price[$i],'currency'=>'pound','res_id'=>$insert_id,'cat_id'=>1]
				);

			}

			echo "Successfully Inserted";
	}

	public function docrawl_babur(){

		$rest_id = json_decode(DB::table('restaurants')->select('res_id')->where('res_name', '=','Babur')->get())[0]->res_id;
		

		if($rest_id){

			DB::table('restaurants')->where('res_id', $rest_id)->delete();

			DB::table('menu_items')->where('res_id', $rest_id)->delete();
	    }

		$client = new Client();
		
		$crawler = $client->request('GET', 'http://www.babur.info/contact/');

		$goutteClient = new Client();
		
		$guzzleClient = new GuzzleClient(array(
		    'timeout' => 60,
		));

		$goutteClient->setClient($guzzleClient);

		$address = $crawler->filter('#contactLocation span');
		
		foreach ($address as $item) {

			$contact[] = $item->textContent;
		}

		$address = $crawler->filter('#contactInfo span');
		
		foreach ($address as $item) {

			$contact[] = $item->textContent;
		}

		//print_r($contact);

		$insert_id = DB::table('restaurants')->insertGetId(
    		['res_name' => 'Babur', 'res_address' => $contact[0],'res_desc'=>"Phone: ".$contact[1],'url'=>'http://www.babur.info']
		);

		

		//echo "<br/><br/>";

		
		
		$res_url = array('http://www.babur.info/our-food-drink/a-la-carte/');

		foreach ($res_url as $value) {

			//echo $value; 	

			$client1 = new Client();

			$crawler1 = $client1->request('GET', $value);
			//$crawler1 = $client1->request('GET', );
			
			$goutteClient1 = new Client();
			
			$guzzleClient1 = new GuzzleClient(array(
			    'timeout' => 60,
			));

			$goutteClient1->setClient($guzzleClient1);

			//Menu name

			$items = $crawler1->filter('.panel-body .caption .text h3');

			foreach ($items as $item) {

				$menu_item[] = $item->textContent;
			}

			//print_r($menu_item);
			//echo "<br/><br/>";

			// price per menu
			$prices = $crawler1->filter('.panel-body .caption .price');

			foreach ($prices as $item) {

			    if(preg_match('/[0-9]+.[0-9]+/', $item->textContent,$array))		    	
			    	$menu_price[] = $array[0];
			}   

			//print_r($menu_price);
			// exit();

			//echo "<br/><br/>";

			// Description 
			$desc = $crawler1->filter('.panel-body .caption .text p');
			//print_r($desc);

			foreach ($desc as $item) {
				//echo strpos($item->textContent, 'GLASS'); echo "<br/>";
				$is_wine = strpos($item->textContent, 'GLASS');
				if($is_wine != 5)
					$menu_desc[] = $item->textContent;
				
			}

			//print_r($menu_desc);
		
		}

		//exit();

		for($i=0; $i<11;$i++){

				DB::table('menu_items')->insert(
	    		['item_name' => $menu_item[$i], 'item_desc' => $menu_desc[$i],'item_price'=>$menu_price[$i],'currency'=>'pound','res_id'=>$insert_id,'cat_id'=>2]
				);

			}

		echo "Successfully Inserted";
	}

	public function pdf_to_text(){

		    //header('Content-type: text/plain; charset=utf-8');
			echo app_path().'\Http\Controllers\PdfToText\PdfToText.phpclass';

			include(app_path() . '\Providers\PdfToText\PdfToText.phpclass');		

			$pdf 	=  new PdfToText( 'https://www.salathai-chemnitz.de/app/download/5790392929/Speisekarte+Vita-Center.pdf') ; //echo $pdf ->Text ; 		// or you could also write : echo ( string ) $pdf ;
	
			$str = $pdf ->Text;
			$arr = explode("\n", $str);
			var_dump($arr);
	}
		
}
