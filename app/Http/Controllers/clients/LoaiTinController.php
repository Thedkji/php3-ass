<?php

namespace App\Http\Controllers\clients;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class LoaiTinController extends Controller
{
    public $data = [];
    public function getData($id)
    {
        return DB::table('posts')
            ->join('authors as a', 'posts.id_author', 'a.id')
            ->join('categories as c', 'posts.id_category', 'c.id')
            ->where('posts.id_category', $id)
            ->orderByDesc('posts.id')
            ->select('posts.*', 'a.name as author_name', 'c.name as category_name')
            ->get();
    }
    public function loaiTin($id)
    {
        $this->data['getData'] = $this->getData($id);
        return view('clients.LoaiTin.loai-tin', $this->data);
    }
}
