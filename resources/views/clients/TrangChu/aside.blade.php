<aside class="col-lg-4 sidebar-home">
    <!-- Search -->
    <div class="widget">
        <h4 class="widget-title"><span>Tìm kiếm</span></h4>
        <form action="{{ route('tim-kiem') }}" class="widget-search" method="post">
            @csrf <!-- Thêm mã này để Laravel xử lý bảo mật CSRF -->
            <input class="mb-3" id="search-query" name="keyNamePost" type="search"
                placeholder="Tìm kiếm bài viết , tác giả ,..." value="">
            <button type="submit" class="btn btn-primary btn-block" name="btn-search">Tìm kiếm</button>
        </form>
    </div>

    <!-- about me -->
    {{-- <div class="widget widget-about">
        <h4 class="widget-title">Hi, I am Alex!</h4>
        <img class="img-fluid" src="{{ config('app.url') }}resources/resources/images/author.jpg" alt="Themefisher">
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vel in in donec iaculis tempus odio
            nunc laoreet . Libero ullamcorper.</p>
        <ul class="list-inline social-icons mb-3">

            <li class="list-inline-item"><a href="#"><i class="ti-facebook"></i></a></li>

            <li class="list-inline-item"><a href="#"><i class="ti-twitter-alt"></i></a></li>

            <li class="list-inline-item"><a href="#"><i class="ti-linkedin"></i></a></li>

            <li class="list-inline-item"><a href="#"><i class="ti-github"></i></a></li>

            <li class="list-inline-item"><a href="#"><i class="ti-youtube"></i></a></li>

        </ul>
        <a href="about-me.html" class="btn btn-primary mb-2">About me</a>
    </div> --}}


    <!-- authors -->
    <div class="widget widget-author">
        <h4 class="widget-title">Tác giả</h4>
        @for ($i = 0; $i < count($data['getAll']); $i++)
            @if ($i <= 5)
                <div class="media align-items-center">
                    <div class="mr-3">
                        <img class="widget-author-image" src="{{ config('app.url') }}resources/images/john-doe.jpg">
                    </div>
                    <div class="media-body">
                        <h5 class="mb-1"><a class="post-title"
                                href="author-single.html">{{ $data['getAll'][$i]->name }}</a>
                        </h5>
                        <span>{{ $data['getAll'][$i]->bio }}</span>
                    </div>
                </div>
            @endif
        @endfor
    </div>
    <!-- Search -->

    <div class="widget">
        <h4 class="widget-title"><span>Không bao giờ bỏ lỡ tin tức</span></h4>
        <form action="#!" method="post" name="mc-embedded-subscribe-form" target="_blank" class="widget-search">
            <input class="mb-3" id="search-query" name="s" type="search" placeholder="Điền vào email của bạn">
            <i class="ti-email"></i>
            <button type="submit" class="btn btn-primary btn-block" name="subscribe">Gửi ngay</button>
            <div style="position: absolute; left: -5000px;" aria-hidden="true">
                <input type="text" name="b_463ee871f45d2d93748e77cad_a0a2c6d074" tabindex="-1">
            </div>
        </form>
    </div>

    <!-- categories -->
    {{-- <div class="widget widget-categories">
        <h4 class="widget-title"><span>Danh mục</span></h4>
        <ul class="list-unstyled widget-list">
            <li><a href="tags.html" class="d-flex">Creativity <small class="ml-auto">(4)</small></a>
            </li>
            <li><a href="tags.html" class="d-flex">Demo <small class="ml-auto">(1)</small></a></li>
            <li><a href="tags.html" class="d-flex">Elements <small class="ml-auto">(1)</small></a>
            </li>
            <li><a href="tags.html" class="d-flex">Food <small class="ml-auto">(1)</small></a></li>
            <li><a href="tags.html" class="d-flex">Microwave <small class="ml-auto">(1)</small></a>
            </li>
            <li><a href="tags.html" class="d-flex">Natural <small class="ml-auto">(3)</small></a>
            </li>
            <li><a href="tags.html" class="d-flex">Newyork city <small class="ml-auto">(1)</small></a>
            </li>
            <li><a href="tags.html" class="d-flex">Nice <small class="ml-auto">(1)</small></a></li>
            <li><a href="tags.html" class="d-flex">Tech <small class="ml-auto">(2)</small></a></li>
            <li><a href="tags.html" class="d-flex">Videography <small class="ml-auto">(1)</small></a>
            </li>
            <li><a href="tags.html" class="d-flex">Vlog <small class="ml-auto">(1)</small></a></li>
            <li><a href="tags.html" class="d-flex">Wondarland <small class="ml-auto">(1)</small></a>
            </li>
        </ul>
    </div> --}}
    <!-- tags -->
    {{-- <div class="widget">
        <h4 class="widget-title"><span>Tags</span></h4>
        <ul class="list-inline widget-list-inline widget-card">
            <li class="list-inline-item"><a href="tags.html">City</a></li>
            <li class="list-inline-item"><a href="tags.html">Color</a></li>
            <li class="list-inline-item"><a href="tags.html">Creative</a></li>
            <li class="list-inline-item"><a href="tags.html">Decorate</a></li>
            <li class="list-inline-item"><a href="tags.html">Demo</a></li>
            <li class="list-inline-item"><a href="tags.html">Elements</a></li>
            <li class="list-inline-item"><a href="tags.html">Fish</a></li>
            <li class="list-inline-item"><a href="tags.html">Food</a></li>
            <li class="list-inline-item"><a href="tags.html">Nice</a></li>
            <li class="list-inline-item"><a href="tags.html">Recipe</a></li>
            <li class="list-inline-item"><a href="tags.html">Season</a></li>
            <li class="list-inline-item"><a href="tags.html">Taste</a></li>
            <li class="list-inline-item"><a href="tags.html">Tasty</a></li>
            <li class="list-inline-item"><a href="tags.html">Vlog</a></li>
            <li class="list-inline-item"><a href="tags.html">Wow</a></li>
        </ul>
    </div> --}}
    <!-- recent post -->
    <div class="widget">
        <h4 class="widget-title">Bài viết gần đây</h4>

        <!-- post-item -->
        @foreach ($data['listPostRecent']->take(5) as $list)
            <article class="widget-card">
                <div class="d-flex">
                    <img class="card-img-sm" src="img/{{ $list->img }}">
                    <div class="ml-3">
                        <h5><a class="post-title" href="{{ route('chi-tiet', $list->id) }}/">{{ $list->title }}</a>
                        </h5>
                        <ul class="card-meta list-inline mb-0">
                            <li class="list-inline-item mb-0">
                                <i
                                    class="ti-calendar"></i>{{ \Carbon\Carbon::parse($list->created_at)->format('m-d-Y') }}
                            </li>
                        </ul>
                    </div>
                </div>
            </article>
        @endforeach
    </div>

    <!-- Social -->
    <div class="widget">
        <h4 class="widget-title"><span>Mạng xã hội</span></h4>
        <ul class="list-inline widget-social">
            <li class="list-inline-item"><a href="#"><i class="ti-facebook"></i></a></li>
            <li class="list-inline-item"><a href="#"><i class="ti-twitter-alt"></i></a></li>
            <li class="list-inline-item"><a href="#"><i class="ti-linkedin"></i></a></li>
            <li class="list-inline-item"><a href="#"><i class="ti-github"></i></a></li>
            <li class="list-inline-item"><a href="#"><i class="ti-youtube"></i></a></li>
        </ul>
    </div>
</aside>
