<?php namespace App\Http\Controllers;
use App\User;
use Illuminate\Http\Request;
use App\Http\Requests;
use JWTAuth;
use Response;
use App\Repository\Transformers\UserTransformer;
use \Illuminate\Http\Response as Res;
use Validator;
use Tymon\JWTAuth\Exceptions\JWTException;
use Illuminate\Support\Facades\DB;

class MenuController extends ApiController
{
    
    public function __construct()
    {
       
    }

    public function index($api_token)
    {
        try{

            //$user = JWTAuth::toUser($api_token);


             $fp = fopen('data.txt', 'w');
                fwrite($fp, 'ddsd');
                fclose($fp);

            //if($user->api_token){

                $this->setStatusCode(Res::HTTP_OK);

                $items = DB::table('menu_items')->leftJoin('restaurants', 'menu_items.res_id', '=', 'restaurants.res_id')->leftJoin('menu_categories', 'menu_items.cat_id', '=', 'menu_categories.cat_id')->where('menu_items.is_deleted',0)->get();

                $categories = DB::table('menu_categories')->select('*')->where('is_deleted',0)->get();

                return $this->respond([
                    'status' => 'success',
                    'status_code' => $this->getStatusCode(),
                    'data' => $items,
                    'cat' => $categories,
                    'search_str' => '',
                    'search_cat' => '',
                    'search_desc' => ''
                ]);           
            

        }catch(JWTException $e){
            return $this->respondInternalError("An error occurred while performing an action!");
        }
    }

    public function menuitem(Request $request)
    {
        try{

                $fp = fopen('data.txt', 'w');
                fwrite($fp, $request['item_name']);
                fclose($fp);
            

                $this->setStatusCode(Res::HTTP_OK);

                // $condition  = '';

                $item_name = $request->all()['item_name'];
                $item_desc = $request->all()['item_desc'];
                $category = $request->all()['category'];
               

                //     $items = DB::table('menu_items')->leftJoin('restaurants', 'menu_items.res_id', '=', 'restaurants.res_id')->leftJoin('menu_categories', 'menu_items.cat_id', '=', 'menu_categories.cat_id')->where('menu_items.is_deleted',0)->where('menu_items.item_name','like','%'.$request->all()['item_name'].'%')->where('menu_items.cat_id',$request->all()['category'])->get();

                

                $items = DB::table('menu_items')
                    ->leftJoin('restaurants', 'menu_items.res_id', '=', 'restaurants.res_id')
                    ->leftJoin('menu_categories', 'menu_items.cat_id', '=', 'menu_categories.cat_id')
                    ->when($item_name, function ($query) use ($item_name) {
                    return $query->where('menu_items.item_name','like', '%'.$item_name.'%');
                    })
                    ->when($item_desc, function ($query) use ($item_desc) {
                    return $query->where('menu_items.item_desc','like', '%'.$item_desc.'%');
                    })
                    ->when($category, function ($query) use ($category) {
                    return $query->where('menu_items.cat_id',$category);
                    })
                    ->get();
        

                $categories = DB::table('menu_categories')->select('*')->where('is_deleted',0)->get();

                return $this->respond([
                    'status' => 'success',
                    'status_code' => $this->getStatusCode(),
                    'data' => $items,
                    'cat' => $categories,
                    'search_str' => $item_name,
                    'search_cat' => $category,
                    'search_desc' =>$item_desc
                ]);

                       

        }catch(JWTException $e){
            return $this->respondInternalError("An error occurred while performing an action!");
        }
    }
       
    
}