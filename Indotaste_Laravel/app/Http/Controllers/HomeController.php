<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use App\Models\Food;
use App\Models\pesanans;
use App\Models\products;


class HomeController extends Controller
{
    public function index()
    {
        $dataProducts = products::all();
        if(request()->segment(1) == 'api') return response()->json([
            "error" => false,
            "listProduct" => $dataProducts,
        ]);
        return view('products.index', ['listProduct' => $dataProducts]);
        
    }

    public function redirects()
    {
        if(Auth::guest())
        {
            return redirect('/');
        }
        else
        {
            $data=food::all();
            $usertype= Auth::user()->usertype;
    
            if($usertype=='1')
            {
                return view('admin.adminhome');
            }
            else
            {
                $user_id=Auth::id();
                $count=cart::where('user_id',$user_id)->count();
    
                return view('home', compact("data","count"));
            }
        }
    }

    public function menu()
    {
        if(Auth::guest())
        {
            return redirect('/');
        }
        else
        {
            $user_id=Auth::id();
            $count=cart::where('user_id',$user_id)->count();
    
            $data=food::all();
            return view("food", compact("data","count"));
        }
    }

    public function addcart(Request $request, $id)
    {
        if(Auth::id())
        {
            $user_id=Auth::id();
            $foodid=$id;
            $quantity=$request->quantity;

            $cart=new cart;

            $cart->user_id=$user_id;
            $cart->food_id=$foodid;
            $cart->quantity=$quantity;

            $cart->save();
            
            return redirect()->back();
        }
        else
        {
            return redirect('/login');
        }
    }

    public function showcart(Request $request,$id)
    {
        if(Auth::guest())
        {
            return redirect('/');
        }
        else
        {
            $user_id=Auth::id();
    
            $data = cart::where('user_id', $user_id)->join('food', 'carts.food_id', '=', 'food.id')->get();
    
            $data2=cart::select('*')->where('user_id','=',$id)->get();
    
            $count=cart::where('user_id',$user_id)->count();
    
            return view('showcart', compact('data',"count", 'data2'));
        }
    }

    public function remove($id)
    {
        // $data=cart::where('id',$id)->first();
        $data=cart::find($id);

        $data->delete();

        return redirect()->back();
    }
}
