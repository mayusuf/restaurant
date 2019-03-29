<?php 
	
	// Database Connection. 
    // please confifuge it as your need.
    // params : hostname, user, password
	$link = mysql_connect('localhost','root','');

	  if($link){
	  	//params : DB name	
	    $db = mysql_select_db('restaurant',$link);  

	  }else{
	      echo "Connection not successfull";
		die();  	
	  }
	  
	$rest_id = mysql_fetch_row(mysql_query("Select res_id from restaurants where res_name = 'Salathai'"))[0];


    if($rest_id){

		 mysql_query("DELETE FROM restaurants WHERE res_id = $rest_id");
		 mysql_query("DELETE FROM menu_items WHERE res_id = $rest_id");

	}


	header('Content-type: text/plain; charset=utf-8');

	include ( 'PdfToText.phpclass' ) ;

	$pdf 	=  new PdfToText ( 'https://www.salathai-chemnitz.de/app/download/5790392929/Speisekarte+Vita-Center.pdf' ) ;
	//echo $pdf ->Text ; 		// or you could also write : echo ( string ) $pdf ;
	
	 $str = $pdf ->Text;
	 $arr = explode("\n", $str);

	//var_dump($arr);

	$address = $arr[2] .' '.$arr[3];

	// insert restaurant details
	$sql1 = "INSERT INTO restaurants(res_name,res_address,res_desc,url) VALUES('Salathai'".",'".$address."','".$arr[4]."','".$arr[5]."')";

	//echo "<br/>";  		

	mysql_query($sql1);
	
  	$res_ID = mysql_insert_id();

	foreach ($arr as $item) {

		    //echo $item;
		    if(preg_match('/^[0-9]+.[ a-zA-ZäöüÖÄÜ,]*[1-9]+,[0-9]+/', $item,$array)){

		    	 //print_r($array);
		    	 
		    	 $ex_str = explode('.', $array[0]);
		    	 //print_r($ex_str);

		    	 //echo $array[0]; 
		    	if(preg_match('/[0-9]+,[0-9]+/', $ex_str[1],$array1))
		    	    //print_r($array1);

		    	$item_name = str_replace($array1[0], '', $ex_str[1]);

		    	//insert item
		     	$sql1 = "INSERT INTO menu_items(item_name,item_price,res_id,cat_id) VALUES('".$item_name."','".$array1[0]."',".$res_ID.",1)";

				mysql_query($sql1);
		    }    	
			    	
			    	
	}

	echo "Successfully Inserted";

?>