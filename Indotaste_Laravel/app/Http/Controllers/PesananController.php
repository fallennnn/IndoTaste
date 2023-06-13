<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\pesanans;


class PesananController extends Controller
{
    public function index()
    {
        $dataPesanans = pesanans::all();
        if(request()->segment(1) == 'api') return response()->json([
            "error" => false,
            "listPesanan" => $dataPesanans,
        ]);
        return view('pesanans.index', ['listPesanan' => $dataPesanans]);
        
    }

    public function addpesanan(Request $request)
    {
        //validate fields
        $attrs = $request->validate([
            'user_id' => 'required|integer',
            'product_id' => 'required|integer',
            'tanggal' => 'required|date',
            'status' => 'required|string',
            'jumlah' => 'required|integer',
            'jumlah_harga' => 'required|integer'
        ]);

        //create user
        $dataPesanans = Pesanans::create([
            'user_id' => $attrs['user_id'],
            'product_id' => $attrs['product_id'],
            'tanggal' => $attrs['tanggal'],
            'status' => $attrs['status'],
            'jumlah' => $attrs['jumlah'],
            'jumlah_harga' => $attrs['jumlah_harga']
        ]);

        return response([
            'product_id' => $dataPesanans
        ]);
    }
    
    public function truncateTable()
    {
        Pesanans::truncate();

        // Atau alternatif:
        // DB::table('nama_tabel')->truncate();

        return response()->json(['message' => 'Data dalam tabel berhasil dihapus']);
    }

}
