<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;

class ApiController extends Controller
{
    public function memanggilAPI()
    {
        // token bearer
        $token = "2|8RRBgIvtdU5jsfwZ2p1M9BLrhWnUMvbnfzKSs1VR";
        $response = Http::withHeaders([
            'Accept' => 'application/json',
            'Authorization' => 'Bearer '.$token
        ])
        ->get('http://localhost/Praktikum07/public/api/getAllUsersToo');

        $jsonData = $response->json();

        return response()->json($jsonData, $response->getStatusCode());
    }
}
