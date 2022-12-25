<?php

namespace App\Http\Controllers;

use App\Models\Collection;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use App\Http\Resources\Collection as CollectionResource;
use App\Http\Controllers\BaseController as BaseController;

class CollectionController extends BaseController
{
    //
    public function getCollection()
    {
        $collections = DB::table('collections as c')
            ->select(
                'id',
                'namaKoleksi',
                DB::raw('(CASE WHEN c.jenisKoleksi = 1 THEN "Buku"
                WHEN c.jenisKoleksi = 2 THEN "Majalah"
                ELSE "Cakram Digital" END) AS jenisKoleksi'),
                'jumlahKoleksi',
                'jumlahSisa',
                'jumlahKeluar'
            )
            ->orderBy('namaKoleksi', 'asc')
            ->get();
        return response()->json($collections, 200);
    }

    public function index()
    {
        $collections = Collection::all();
        return $this->sendResponse(
            CollectionResource::collection($collections),
            'Posts fetched.'
        );
    }

    public function store(Request $request)
    {
        $input = $request->all();
        $validator = Validator::make($input, [
            'namaKoleksi' => 'required',
            'jenisKoleksi' => 'required',
            'jumlahKoleksi' => 'required',
            'jumlahAwal' => 'required',
            'jumlahSisa' => 'required',
            'jumlahKeluar' => 'required',

        ]);
        if ($validator->fails()) {
            return $this->sendError($validator->errors());
        }
        $collection = Collection::create($input);
        return $this->sendResponse(new CollectionResource($collection), 'Post created.');
    }

    public function show($id)
    {
        $collection = Collection::find($id);
        if (is_null($collection)) {
            return $this->sendError('Post does not exist.');
        }
        return $this->sendResponse(new CollectionResource($collection), 'Post fetched.');
    }

    public function update(Request $request, Collection $collection)
    {
        $input = $request->all();
        $validator = Validator::make($input, [
            'namaKoleksi' => 'required',
            'jenisKoleksi' => 'required',
            'jumlahKoleksi' => 'required',
            'jumlahAwal' => 'required',
            'jumlahSisa' => 'required',
            'jumlahKeluar' => 'required',
        ]);

        if ($validator->fails()) {
            return $this->sendError($validator->errors());
        }

        $collection->namaKoleksi = $input['namaKoleksi'];
        $collection->jenisKoleksi = $input['jenisKoleksi'];
        $collection->jumlahKoleksi = $input['jumlahKoleksi'];
        $collection->jumlahAwal = $input['jumlahAwal'];
        $collection->jumlahSisa = $input['jumlahSisa'];
        $collection->jumlahKeluar = $input['jumlahKeluar'];
        $collection->save();

        return $this->sendResponse(new CollectionResource($collection), 'Post updated.');
    }

    public function destroy(Collection $collection)
    {
        $collection->delete();
        return $this->sendResponse([], 'Post deleted.');
    }
}
