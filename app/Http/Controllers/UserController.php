<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class UserController extends Controller
{
    public function getUsers()
    {
        $users = DB::table('users')
        ->select(
            'id',
            'username',
            'fullname',
            'email',
            'alamat',
            'birthdate',
            'phoneNumber'
        )
        ->orderBy('username', 'asc')
        ->get();
        return response()->json($users, 200);
    }
}
