@extends('clients.layout.master')

@section('title', 'Tìm kiếm')

@section('body')
    <div class="py-4"></div>
    <div class="container">
        <div class="row">
            <div class="col-lg-8  mb-5 mb-lg-0">
                <h1 class="h2 mb-4">Showing items from <mark>color</mark></h1>
                @if (isset($dataSearch))
                    @foreach ($dataSearch as $list)
                        <article class="card mb-4">
                            <div class="post-slider">
                                <img src="{{ config('app.url') }}public/img/{{ $list->img }}" class="card-img-top"
                                    alt="post-thumb">
                            </div>
                            <div class="card-body">
                                <h3 class="mb-3"><a class="post-title"
                                        href="{{ route('chi-tiet', $list->id) }}">{{ $list->title }}</a>
                                </h3>
                                <ul class="card-meta list-inline">
                                    <li class="list-inline-item">
                                        <a href="author-single.html" class="card-meta-author">
                                            <img src="images/john-doe.jpg">
                                            <span>{{ $list->name }}</span>
                                        </a>
                                    </li>
                                    <li class="list-inline-item">
                                        <i class="ti-timer"></i>2 Min To Read
                                    </li>
                                    <li class="list-inline-item">
                                        <i class="ti-calendar"></i>14 jan, 2020
                                    </li>
                                    <li class="list-inline-item">
                                        <ul class="card-meta-tag list-inline">
                                            <li class="list-inline-item"><a href="tags.html">Color</a></li>
                                            <li class="list-inline-item"><a href="tags.html">Recipe</a></li>
                                            <li class="list-inline-item"><a href="tags.html">Fish</a></li>
                                        </ul>
                                    </li>
                                </ul>
                                <p>It’s no secret that the digital industry is booming. From exciting startups to global
                                    brands,
                                    companies are reaching out to digital agencies, responding to the new possibilities
                                    available.
                                </p>
                                <a href="post-details.html" class="btn btn-outline-primary">Read More</a>
                            </div>
                        </article>
                    @endforeach
                @else
                    <p>Không tìm thấy kết quả nào.</p>
                @endif
            </div>

            @include('clients.TrangChu.aside')

        </div>
    </div>
@endsection
