<section class="section pb-0">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 mb-5">
                <h2 class="h5 section-title">Bài đăng gần đây</h2>
                <article class="card">
                    <div class="post-slider slider-sm">
                        <img src="img/{{ $data['listPostRecent']->first()->img }}" class="card-img-top" alt="post-thumb">
                    </div>

                    <div class="card-body">
                        <h3 class="h4 mb-3"><a class="post-title"
                                href="{{ route('chi-tiet', $data['listPostRecent']->first()->id) }}">
                                {{ $data['listPostRecent']->first()->title }}
                            </a></h3>
                        <ul class="card-meta list-inline">
                            <li class="list-inline-item">
                                <a href="author-single.html" class="card-meta-author">
                                    <img src="../resources/images/john-doe.jpg">
                                    <span>{{ $data['listPostRecent']->first()->name_author }} </span>
                                </a>
                            </li>
                            <li class="list-inline-item">
                                <i class="ti-timer"></i><i
                                    class="ti-calendar"></i>{{ \Carbon\Carbon::parse($data['listPostRecent']->first()->created_at)->diffForHumans() }}
                            </li>
                            <li class="list-inline-item">
                                <i
                                    class="ti-calendar"></i>{{ \Carbon\Carbon::parse($data['listPostRecent']->first()->created_at)->format('d-m-Y') }}
                            </li>
                            {{-- <li class="list-inline-item">
                                <ul class="card-meta-tag list-inline">

                                    <li class="list-inline-item"><a href="tags.html"></a></li>

                                </ul>
                            </li> --}}
                        </ul>
                        <div style="width:100% ; overflow:hidden">

                            @php
                                $content = $data['listPostRecent']->first()->content;
                                $maxLength = 200;
                                if (strlen($content) > $maxLength) {
                                    $content = substr($content, 0, $maxLength) . '...';
                                }
                            @endphp
                            <p style="white-space: nowrap">{!! $content !!} </p>
                        </div>
                        <a href="post-details.html" class="btn btn-outline-primary">Xem thêm</a>
                    </div>
                </article>
            </div>
            <div class="col-lg-4 mb-5">
                <h2 class="h5 section-title">Bài viết Trending</h2>

                @foreach ($data['listPostTrend']->take(3) as $list)
                    <article class="card mb-4">
                        <div class="card-body d-flex">
                            <img class="card-img-sm" src="img/{{ $list->img }}">
                            <div class="ml-3">
                                <h4><a href="{{ route('chi-tiet', $list->id) }}"
                                        class="post-title">{!! $list->title !!}</a>
                                </h4>
                                <ul class="card-meta list-inline mb-0">
                                    <li class="list-inline-item mb-0">
                                        <i
                                            class="ti-calendar"></i>{{ \Carbon\Carbon::parse($list->created_at)->format('m-d-Y') }}
                                    </li>
                                    <li class="list-inline-item mb-0">
                                        <i
                                            class="ti-timer"></i>{{ \Carbon\Carbon::parse($list->created_at)->diffForHumans() }}
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </article>
                @endforeach
            </div>

            <div class="col-lg-4 mb-5">
                <h2 class="h5 section-title">Bài viết phổ biến</h2>

                <article class="card">
                    <div class="post-slider slider-sm">
                        <img src="img/{{ $data['listPostPopular']->first()->img }}" class="card-img-top"
                            alt="post-thumb">

                    </div>
                    <div class="card-body">
                        <h3 class="h4 mb-3"><a class="post-title"
                                href="{{ route('chi-tiet', $data['listPostPopular']->first()->id) }}">{!! $data['listPostPopular']->first()->title !!}</a>
                        </h3>
                        <ul class="card-meta list-inline">
                            <li class="list-inline-item">
                                <a href="author-single.html" class="card-meta-author">
                                    <img src="../resources/images/kate-stone.jpg" alt="Kate Stone">
                                    <span>{{ $data['listPostPopular']->first()->name }}</span>
                                </a>
                            </li>
                            <li class="list-inline-item">
                                <i
                                    class="ti-timer"></i>{{ \Carbon\Carbon::parse($data['listPostRecent']->first()->created_at)->diffForHumans() }}
                            </li>
                            <li class="list-inline-item">
                                <i
                                    class="ti-calendar"></i>{{ \Carbon\Carbon::parse($data['listPostRecent']->first()->created_at)->format('d-m-Y') }}
                            </li>
                        </ul>
                        <div style="overflow:hidden">
                            <p style="white-space: nowrap">{!! $data['listPostPopular']->first()->title !!}</p>
                        </div>
                        <a href="post-details.html" class="btn btn-outline-primary">Xem thêm</a>
                    </div>
                </article>
            </div>
            <div class="col-12">
                <div class="border-bottom border-default"></div>
            </div>
        </div>
    </div>
</section>
