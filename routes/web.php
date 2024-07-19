<?php

use App\Http\Controllers\clients\ChiTietController;
use App\Http\Controllers\clients\LoaiTinController;
use App\Http\Controllers\clients\TrangChuController;
use App\Http\Controllers\clients\TimKiemController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

// Route::get('/', function () {
//     return view('welcome');
// });

Route::get('/', [TrangChuController::class, 'TrangChu'])->name('trang-chu');

Route::get('/chi-tiet/{id}', [ChiTietController::class, 'chiTiet'])->name('chi-tiet');

Route::get('/loai-tin/{id}', [LoaiTinController::class, 'loaiTin'])->name('loai-tin');

Route::match(['get', 'post'], '/tim-kiem', [TimKiemController::class, 'timKiem'])->name('tim-kiem');