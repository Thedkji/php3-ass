<?php

namespace App\Providers;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        $data = [];
        function showTag($offset = 0, $limit = 10)
        {
            // join bảng tags với bảng post_tag để đếm số lượng tag có bài viết cao nhát 
            return DB::table('tags')
                ->join('posts_tags as pt', 'tags.id', '=', 'pt.id_tag')
                ->select('tags.*', DB::raw('COUNT(pt.id_post) as post_count'))
                ->groupBy('tags.id')
                ->orderBy('post_count', 'desc')
                ->offset($offset)
                ->limit($limit)
                ->get();
        }
        // show tag
        $data['listTag'] = showTag(0, 10);
        $data['tagBar'] = showTag(0, 20);

        // show Danh mục
        $data['listCate'] = DB::table('categories')->orderByDesc('id')->get();

        // Show các bài viết theo từng mục
        // Show bài viết gần đây
        $data['listPostRecent'] = DB::table('posts')
            ->join('authors', 'posts.id_author', '=', 'authors.id')
            ->select('posts.*', 'authors.name as name_author')
            ->orderByDesc('posts.created_at')
            ->get();

        // Show bài viết nổi bật
        $data['listPostPopular'] = DB::table('posts')
            ->join('authors as at', 'posts.id_author', '=', 'at.id')
            ->join('posts_tags as pt', 'posts.id', '=', 'pt.id_post')
            ->join('tags as t', 't.id', '=', 'pt.id_tag')
            ->select('posts.id','posts.img', 'posts.title', 'posts.created_at', 't.tag_name', 'at.name', DB::raw('COUNT(pt.id_post) as post_count'))
            ->groupBy('posts.id', 'posts.title', 'posts.created_at', 't.id', 'at.name')
            ->orderByDesc('post_count');

        // Show bài viết hot
        $data['listPostTrend'] = DB::table('posts')
            ->where([
                [
                    'view_like', '>', 200
                ],
                [
                    'total_view', '>', 300
                ],
            ])
            ->orderByDesc('id')
            ->get();

        // Xử lý phân trang
        $data['listPostPaginate'] = DB::table('posts')
            ->join('authors', 'posts.id_author', '=', 'authors.id')
            ->select('posts.*', 'authors.name as name_author')
            ->orderByDesc('posts.created_at')
            ->paginate(3);

        // Tính toán tổng số trang
        $count_posts = DB::table('posts')->count();
        $data['count_page'] = ceil($count_posts / 5);

        //Lấy nhanh toàn bộ dữ liệu 
        $data['getAll'] = DB::table('posts')
            ->join('authors as a', 'posts.id_author', 'a.id')
            ->join('posts_tags as pt', 'pt.id_post', 'posts.id')
            ->join('tags as t', 'pt.id_tag', 't.id')
            ->orderByDesc('posts.id')
            ->get();
        //Lấy nhanh 1 dữ liệu 

        
        view()->share('data', $data);
    }
}
