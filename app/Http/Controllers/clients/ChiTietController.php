<?php

namespace App\Http\Controllers\clients;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ChiTietController extends Controller
{
    public $data = [];
    public function getOneData($id){
        return DB::table('posts')
        ->leftJoin('authors as a', 'posts.id_author', 'a.id')
        ->leftJoin('posts_tags as pt', 'pt.id_post', 'posts.id')
        ->leftJoin('tags as t', 'pt.id_tag', 't.id')
        ->where('posts.id',$id)
        ->orderByDesc('posts.id')
        ->first();
    }
    public function chiTiet($id){
        $this->data['getOne'] = $this->getOneData($id);
        return view('clients.ChiTiet.chi-tiet',$this->data);
    }
}
