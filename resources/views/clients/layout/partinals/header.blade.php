<header class="navigation fixed-top bg-white">
    <div class="container">
        <nav class="navbar navbar-expand-lg navbar-white">
            <a class="navbar-brand order-1" href="{{ route('trang-chu') }}">
                <img class="img-fluid" width="100px" src="{{ config('app.url') }}resources/images/logo.png"
                    alt="Reader | Hugo Personal Blog Template">
            </a>
            <div class="collapse navbar-collapse text-center order-lg-2 order-3" id="navigation">
                <ul class="navbar-nav mx-auto">
                    <li class="nav-item dropdown">
                        <a class="nav-link" href="{{ route('trang-chu') }}" role="button" data-toggle="dropdown"
                            aria-haspopup="true" aria-expanded="true">
                            Trang chủ
                        </a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link" href="#" role="button" data-toggle="dropdown" aria-haspopup="true"
                            aria-expanded="false">
                            Danh mục <i class="ti-angle-down ml-1"></i>
                        </a>
                        <div class="dropdown-menu">

                            @foreach ($data['listCate'] as $data)
                                <a class="dropdown-item"
                                    href="{{ route('loai-tin', $data->id) }}">{{ $data->name }}</a>
                            @endforeach

                        </div>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="contact.html">Liên hệ</a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link" href="#" role="button" data-toggle="dropdown" aria-haspopup="true"
                            aria-expanded="false">Trang <i class="ti-angle-down ml-1"></i>
                        </a>
                        <div class="dropdown-menu">

                            <a class="dropdown-item" href="author.html">Tác giả</a>

                            <a class="dropdown-item" href="author-single.html">Bài viết</a>

                        </div>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link" href="#" role="button" data-toggle="dropdown" aria-haspopup="true"
                            aria-expanded="false">Tài khoản {{-- <i class="ti-angle-down ml-1"></i> --}}
                        </a>
                        <div class="dropdown-menu">

                            <a class="dropdown-item" href="author-single.html">Đăng nhập</a>

                            <a class="dropdown-item" href="author.html">Đăng ký</a>

                        </div>
                    </li>
                </ul>
            </div>

            <div class="order-2 order-lg-3 d-flex align-items-center">
                {{-- <select class="m-2 border-0 bg-transparent" id="select-language">
                    <option id="en" value="" selected>En</option>
                    <option id="fr" value="">Fr</option>
                </select> --}}

                <!-- search -->
                <form class="search-bar" action="{{ route('tim-kiem') }}" method="post">
                    @csrf
                    <input id="search-query" type="search" placeholder="Tìm kiếm bài viết , tác giả ,..."
                        name = "keyNamePost">

                    <button class="navbar-toggler border-0 order-1" type="submit" class="btn-search">
                        <i class="ti-menu"></i>
                    </button>
                </form>

            </div>

        </nav>
    </div>
</header>
