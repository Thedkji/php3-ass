{{-- file chạy chính dùng để khởi chạy trang chủ bằng cách kế thừa lại file client.layout.index và ghi đè body --}}
@extends('clients.layout.master')
@section('title', 'Trang chủ')

@section('body')

    <!-- start of banner -->
    @include('clients.TrangChu.start-banner')
    <!-- end of banner -->

    {{-- feautured post --}}
    @include('clients.TrangChu.featured-post')
    {{-- end feautured post --}}


    {{-- recent post --}}
    @include('clients.TrangChu.recent-post')
    {{-- end recent post --}}
@endsection
