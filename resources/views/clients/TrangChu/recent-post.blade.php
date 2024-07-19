<section class="section-sm">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8  mb-5 mb-lg-0">
                <h2 class="h5 section-title">CÁC BÀI ĐƯỢC ĐĂNG GẦN ĐÂY</h2>
                {{-- <article class="card mb-4">
                    <div class="post-slider">
                        <img src="../resources/images/post/post-10.jpg" class="card-img-top" alt="post-thumb">
                        <img src="../resources/images/post/post-1.jpg" class="card-img-top" alt="post-thumb">
                    </div>
                    <div class="card-body">
                        <h3 class="mb-3"><a class="post-title" href="post-elements.html">Elements That You Can
                                Use In This Template.</a></h3>
                        <ul class="card-meta list-inline">
                            <li class="list-inline-item">
                                <a href="author-single.html" class="card-meta-author">
                                    <img src="../resources/images/john-doe.jpg" alt="John Doe">
                                    <span>John Doe</span>
                                </a>
                            </li>
                            <li class="list-inline-item">
                                <i class="ti-timer"></i>3 Min To Read
                            </li>
                            <li class="list-inline-item">
                                <i class="ti-calendar"></i>15 jan, 2020
                            </li>
                            <li class="list-inline-item">
                                <ul class="card-meta-tag list-inline">
                                    <li class="list-inline-item"><a href="tags.html">Demo</a></li>
                                    <li class="list-inline-item"><a href="tags.html">Elements</a></li>
                                </ul>
                            </li>
                        </ul>
                        <p>Heading example Here is example of hedings. You can use this heading by following
                            markdownify rules. For example: use # for heading 1 and use ###### for heading 6.</p>
                        <a href="post-elements.html" class="btn btn-outline-primary">Read More</a>
                    </div>
                </article> --}}

                @foreach ($data['listPostPaginate'] as $list)
                    <article class="card mb-4">
                        <div class="post-slider">
                            <img src="img/{{ $list->img }}" class="card-img-top" alt="post-thumb">
                        </div>
                        <div class="card-body">
                            <h3 class="mb-3"><a class="post-title" href="{{ route('chi-tiet',$list->id) }}">{{ $list->title }}</a>
                            </h3>
                            <ul class="card-meta list-inline">
                                <li class="list-inline-item">
                                    <a href="author-single.html" class="card-meta-author">
                                        <img src="../resources/images/john-doe.jpg">
                                        <span>{{ $list->name_author }}</span>
                                    </a>
                                </li>
                                <li class="list-inline-item">
                                    <i
                                        class="ti-timer"></i>{{ \Carbon\Carbon::parse($list->created_at)->diffForHumans() }}
                                </li>
                                <li class="list-inline-item">
                                    <i
                                        class="ti-calendar"></i>{{ \Carbon\Carbon::parse($list->created_at)->format('m-d-Y') }}
                                </li>

                            </ul>
                            <p>
                                @php
                                    $content = $list->content;
                                    $maxLength = 200;
                                    if (strlen($content) > $maxLength) {
                                        $content = substr($content, 0, $maxLength) . '...';
                                    }
                                @endphp
                                {!! $content !!}
                            </p>

                            <a href="post-details.html" class="btn btn-outline-primary">Xem thêm</a>
                        </div>
                    </article>
                @endforeach

                <ul class="pagination justify-content-center">
                    @for ($i = 1; $i <= $data['count_page']; $i++)
                        @if ($i < 7)
                            <li class="page-item page-item active ">
                                <a href="{{ $data['listPostPaginate']->url($i) }}" class="page-link">{{ $i }}</a>
                            </li>
                        @endif
                    @endfor
                    <li class="page-item page-item active ">
                        <a href="#!" class="page-link">...</a>
                    </li>
                    <li class="page-item">
                        <a href="{{ $data['listPostPaginate']->url($data['count_page']) }}" class="page-link">&raquo;</a>
                    </li>
                </ul>
            </div>
            
            @include('clients.TrangChu.aside')
        </div>
    </div>
</section>
