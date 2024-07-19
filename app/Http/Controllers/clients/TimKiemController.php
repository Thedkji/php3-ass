<?php

namespace App\Http\Controllers\clients;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class TimKiemController extends Controller
{
    public function timKiem(Request $request)
    {
        // Khởi tạo biến $dataSearch là mảng rỗng
        $dataSearch = [];

        // Kiểm tra nếu nút tìm kiếm được nhấn
        if ($request->has('btn-search')) {
            // Lấy giá trị từ input 'keyNamePost' của form
            $keyNamePost = $request->input('keyNamePost');

            // Truy vấn dữ liệu từ bảng posts và authors
            $dataSearch = DB::table('posts')
                ->join('authors as a', 'posts.id_author', '=', 'a.id')
                ->where('posts.title', 'like', '%' . $keyNamePost . '%')
                ->orWhere('a.name', 'like', '%' . $keyNamePost . '%')
                ->get();
        }

        // Trả về view với biến dataSearch
        return view('clients.TimKiem.tim-kiem', compact('dataSearch'));
    }
}
