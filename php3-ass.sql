-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th7 19, 2024 lúc 02:49 PM
-- Phiên bản máy phục vụ: 8.0.36
-- Phiên bản PHP: 8.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `php3-ass`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `authors`
--

CREATE TABLE `authors` (
  `id` int NOT NULL,
  `user_name` varchar(40) NOT NULL,
  `pass` varchar(40) NOT NULL,
  `name` varchar(40) NOT NULL,
  `bio` varchar(150) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `number_phone` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `role` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `authors`
--

INSERT INTO `authors` (`id`, `user_name`, `pass`, `name`, `bio`, `date_of_birth`, `email`, `number_phone`, `created_at`, `updated_at`, `role`) VALUES
(1, 'admin', '123', 'An Nguyễn', 'Chuyên gia công nghệ', '1990-05-15', 'an@email.com', '0123456789', '2024-07-05 15:56:30', '2024-07-05 15:56:30', 1),
(2, 'codepro', 'matkhau2', 'Bình Trần', 'Lập trình viên', '1995-02-22', 'binh@email.com', '0987654321', '2024-07-05 15:56:30', '2024-07-05 15:56:30', 0),
(3, 'gadgetgirl', 'matkhau3', 'Chi Mai', 'Yêu công nghệ', '1998-11-08', 'chi@email.com', '0567891234', '2024-07-05 15:56:30', '2024-07-05 15:56:30', 0),
(4, 'geekmaster', 'matkhau4', 'Dũng Lê', 'Tìm hiểu mọi thứ', '1985-09-30', 'dung@email.com', '0432198765', '2024-07-05 15:56:30', '2024-07-05 15:56:30', 0),
(5, 'techlover', 'matkhau5', 'Hằng Phạm', 'Đam mê công nghệ', '2000-03-12', 'hang@email.com', '0876543219', '2024-07-05 15:56:30', '2024-07-05 15:56:30', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Tin tức'),
(2, 'Phần cứng'),
(3, 'Phần mềm'),
(4, 'Thủ thuật'),
(5, 'Đánh giá');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `id` int NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_author` int NOT NULL,
  `id_post` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `comments`
--

INSERT INTO `comments` (`id`, `content`, `created_at`, `updated_at`, `id_author`, `id_post`) VALUES
(1, 'Bài viết rất hữu ích, cảm ơn tác giả!', '2024-07-05 15:56:30', '2024-07-05 15:56:30', 3, 1),
(2, 'Laptop này có đáng mua không nhỉ?', '2024-07-05 15:56:30', '2024-07-05 15:56:30', 5, 2),
(3, 'Tôi đã thử cài đặt và thành công, rất đơn giản!', '2024-07-05 15:56:30', '2024-07-05 15:56:30', 1, 3),
(4, 'Cảm ơn bạn đã chia sẻ những ứng dụng này, tôi sẽ thử!', '2024-07-05 15:56:30', '2024-07-05 15:56:30', 2, 4),
(5, 'Danh sách này thật tuyệt vời, giúp tôi rất nhiều!', '2024-07-05 15:56:30', '2024-07-05 15:56:30', 4, 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `image_gallery`
--

CREATE TABLE `image_gallery` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `id_post` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `image_gallery`
--

INSERT INTO `image_gallery` (`id`, `name`, `id_post`) VALUES
(1, '/images/iphone15_2.jpg', 1),
(2, '/images/iphone15_3.jpg', 1),
(3, '/images/dellxps13_2.jpg', 2),
(4, '/images/windows11_2.jpg', 3),
(5, '/images/top10phones_2.jpg', 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `posts`
--

CREATE TABLE `posts` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `view_like` int NOT NULL,
  `total_view` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_category` int NOT NULL,
  `id_author` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `posts`
--

INSERT INTO `posts` (`id`, `title`, `img`, `content`, `view_like`, `total_view`, `created_at`, `updated_at`, `id_category`, `id_author`) VALUES
(1, 'Xiaomi công bố màu mới cho máy điều hòa không khí dạng đứng, nhìn rất sang, giá khoảng 27,8 triệu đồng', 'Xiaomi-cong-bo-mau-moi-cho-may-dieu-hoa-khong-khi-dang-dung-nhin-rat-sang-gia-khoang-278-trieu-dong-1.jpg', '<div class=\"single-body single-body--wide entry-content typography-copy\">\n                                                \n<p>Ngay khi ấn định ngày ra mắt MIX Fold 4, Xiaomi cũng đã công bố phiên bản màu sắc mới cho dòng điều hòa không khí cao cấp Mijia Fresh Air Pro Dual Outlet Floor-standing 3 HP tại thị trường Trung Quốc. Bên cạnh phiên bản “Starry Silver” (màu Bạc) hiện có, phiên bản Ice Crystal White (màu Trắng) mới hứa hẹn sẽ mang đến vẻ đẹp thanh lịch, phù hợp với nhiều phong cách nội thất khác nhau.</p>\n\n\n\n<figure class=\"wp-block-image size-full\"><img data-lazyloaded=\"1\" src=\"https://vatvostudio.vn/wp-content/uploads/2024/07/Xiaomi-cong-bo-mau-moi-cho-may-dieu-hoa-khong-khi-dang-dung-nhin-rat-sang-gia-khoang-278-trieu-dong-1.jpg\" fetchpriority=\"high\" decoding=\"async\" width=\"1440\" height=\"1920\" data-src=\"https://vatvostudio.vn/wp-content/uploads/2024/07/Xiaomi-cong-bo-mau-moi-cho-may-dieu-hoa-khong-khi-dang-dung-nhin-rat-sang-gia-khoang-278-trieu-dong-1.jpg\" alt=\"\" class=\"wp-image-117051 entered litespeed-loaded\" data-ll-status=\"loaded\"><noscript><img fetchpriority=\"high\" fetchpriority=\"high\" decoding=\"async\" width=\"1440\" height=\"1920\" src=\"https://vatvostudio.vn/wp-content/uploads/2024/07/Xiaomi-cong-bo-mau-moi-cho-may-dieu-hoa-khong-khi-dang-dung-nhin-rat-sang-gia-khoang-278-trieu-dong-1.jpg\" alt=\"\" class=\"wp-image-117051\"/></noscript></figure>\n\n\n\n<p>Theo thông tin chính thức, phiên bản màu mới sẽ được ông Lei Jun – CEO Xiaomi giới thiệu chi tiết trong bài phát biểu thường niên diễn ra vào lúc 7 giờ tối (giờ địa phương) ngày 19 tháng 7 tại Trung Quốc. Đặc biệt, phiên bản “Ice Crystal White” vẫn sẽ giữ nguyên mức giá là 7999 nhân dân tệ (khoảng 27,8 triệu đồng).</p>\n\n\n\n<p>Mijia Fresh Air Pro là dòng điều hòa không khí cao cấp được trang bị nhiều công nghệ tiên tiến của Xiaomi, bao gồm:</p>\n\n\n\n<ul class=\"wp-block-list\">\n<li><strong>Công nghệ Fresh Air Pro độc quyền:</strong>&nbsp;Có thể điều khiển gió độc lập 4 vùng, cho phép phân phối luồng khí góc rộng 180 độ, mang đến luồng không khí trong lành cho mọi ngóc ngách trong phòng.</li>\n\n\n\n<li><strong>Hiệu suất vượt trội:</strong>&nbsp;Trang bị máy nén khí hai xi lanh và dàn ngưng tụ hai hàng, cho phép làm mát nhanh trong 30 giây và sưởi ấm nhanh trong vòng 60 giây.</li>\n\n\n\n<li><strong>Công nghệ lọc khí tiên tiến:</strong>&nbsp;Loại bỏ vi khuẩn, vi rút, phấn hoa và bụi mịn PM2.5, đảm bảo không khí trong lành, an toàn cho sức khỏe.</li>\n\n\n\n<li><strong>Cung cấp không khí trong lành:</strong>&nbsp;Điều hòa của Xiaomi có thể cung cấp 245m³/h không khí trong lành, làm sạch toàn bộ không khí trong nhà chỉ trong 22 phút.</li>\n</ul>\n\n\n\n<p>Tương tự các sản phẩm gia dụng thông minh khác của Xiaomi, Mijia Fresh Air Pro cũng được tích hợp liền mạch với hệ sinh thái nhà thông minh của hãng. Người dùng có thể điều khiển thiết bị từ xa bằng ứng dụng Mi Home và tận dụng các tính năng như Xiaomi HyperOS Connect và Xiaomi Power Smart Connection. Ngoài ra, công cụ điều khiển đám mây thông minh còn giúp duy trì nhiệt độ ổn định và thoải mái bằng cách tự động chọn chế độ tối ưu dựa trên nhiều yếu tố khác nhau.</p>\n\n\n\n<figure class=\"wp-block-embed is-type-wp-embed is-provider-v-t-v-studio-vvs-tin-t-c-v-nh-gi-s-n-ph-m-c-ng-ngh wp-block-embed-v-t-v-studio-vvs-tin-t-c-v-nh-gi-s-n-ph-m-c-ng-ngh\"><div class=\"wp-block-embed__wrapper\">\n<blockquote class=\"wp-embedded-content\" data-secret=\"F6AQH2tFzI\" style=\"display: none;\"><a href=\"https://vatvostudio.vn/xiaomi-mix-fold-4-an-dinh-ngay-ra-mat-dong-thoi-xac-nhan-thong-so-ky-thuat-cuc-khung/\">Xiaomi MIX Fold 4 ấn định ngày ra mắt, đồng thời xác nhận thông số kỹ thuật cực khủng</a></blockquote><iframe class=\"wp-embedded-content\" sandbox=\"allow-scripts\" security=\"restricted\" title=\"“Xiaomi MIX Fold 4 ấn định ngày ra mắt, đồng thời xác nhận thông số kỹ thuật cực khủng” — Vật Vờ Studio - VVS - Tin tức và đánh giá sản phẩm công nghệ\" src=\"https://vatvostudio.vn/xiaomi-mix-fold-4-an-dinh-ngay-ra-mat-dong-thoi-xac-nhan-thong-so-ky-thuat-cuc-khung/embed/#?secret=bobwAZP4jR#?secret=F6AQH2tFzI\" data-secret=\"F6AQH2tFzI\" width=\"600\" height=\"305\" frameborder=\"0\" marginwidth=\"0\" marginheight=\"0\" scrolling=\"no\"></iframe>\n</div></figure>\n\n\n\n<p></p>\n    				</div>', 500, 1200, '2024-07-05 15:56:30', '2024-07-05 15:56:30', 1, 1),
(2, 'Không còn giới hạn ở ứng dụng gốc, Live Translate của Samsung giờ đây còn có thể hoạt động với cả Messenger, Telegram, WhatsApp…', 'Tinh-nang-Live-Translate-tren-dien-thoai-Samsung-se-ho-tro-cac-ung-dung-ben-thu-3.jpg', '<div class=\"single-body single-body--wide entry-content typography-copy\">\n                                                \n<p>Tháng trước, <a href=\"https://vatvostudio.vn/tinh-nang-dich-cuoc-goi-theo-thoi-gian-thuc-cua-samsung-sap-ho-tro-cac-ung-dung-ben-thu-3/\">Samsung</a> đã công bố kế hoạch mở rộng Live Translate (hay còn gọi là Dịch trực tiếp), tính năng dịch thuật thời gian thực của các mẫu điện thoại Samsung cho các ứng dụng gọi điện của bên thứ ba trên Android. Giữ đúng lời hứa, Samsung mới đây đã chính thức cho phép Live Translate hoạt động trên hầu hết các ứng dụng gọi thoại phổ biến của bên thứ ba, chẳng hạn như Messenger, Instagram, v.v.</p>\n\n\n\n<h2 class=\"wp-block-heading\"><strong>Tính năng Live Translate của Samsung hoạt động với tất cả các ứng dụng nhắn tin và gọi thoại phổ biến</strong></h2>\n\n\n\n<p>Cụ thể, với One UI 6.1.1, tính năng Live Translate sẽ hoạt động với hầu hết các ứng dụng nhắn tin và gọi điện của bên thứ 3, bao gồm Facebook Messenger, Google Meet, Instagram, Kakao Talk, LINE, Signal, Telegram, WeChat và WhatsApp. Thông qua ảnh chụp màn hình ở bên dưới, người dùng có thể bật hoặc tắt Live Translate theo từng ứng dụng.</p>\n\n\n<div class=\"wp-block-image\">\n<figure class=\"aligncenter size-full\"><img data-lazyloaded=\"1\" src=\"https://vatvostudio.vn/wp-content/uploads/2024/07/Samsung-Galaxy-AI-Live-Translate-Apps.jpg\" fetchpriority=\"high\" decoding=\"async\" width=\"968\" height=\"2376\" data-src=\"https://vatvostudio.vn/wp-content/uploads/2024/07/Samsung-Galaxy-AI-Live-Translate-Apps.jpg\" alt=\"\" class=\"wp-image-117055 entered litespeed-loaded\" data-ll-status=\"loaded\"><noscript><img fetchpriority=\"high\" fetchpriority=\"high\" decoding=\"async\" width=\"968\" height=\"2376\" src=\"https://vatvostudio.vn/wp-content/uploads/2024/07/Samsung-Galaxy-AI-Live-Translate-Apps.jpg\" alt=\"\" class=\"wp-image-117055\"/></noscript></figure></div>\n\n\n<p>Nhờ vào AI Live Translate, người dùng có thể trao đổi với người nói ngôn ngữ khác mà không cần sử dụng thêm bất kỳ ứng dụng hay thiết bị ngoại vi nào. Được biết, AI Live Translate có thể hoạt động trên cả các thiết bị đến từ các nhà sản xuất khác nhau. Không chỉ điện thoại, tính năng này cũng được <a href=\"http://samsung.com/\" target=\"_blank\" rel=\"noopener\">Samsung</a> tích hợp trên dòng máy tính bảng Galaxy Tab S9. Hơn nữa, vì tất cả quá trình xử lý cho tính năng này đều được thực hiện trên thiết bị, nên dữ liệu của người dùng sẽ được an toàn và bảo mật.</p>\n\n\n\n<p>Người dùng có thể xem cách hoạt động của Live Translate trong video dưới đây.</p>\n\n\n\n<figure class=\"wp-block-video\"><video controls=\"\" src=\"https://vatvostudio.vn/wp-content/uploads/2024/01/Phien-dich-truc-tiep-cuoc-goi.mp4\"></video></figure>\n\n\n\n<p>Tính năng Live Translate với các ứng dụng của bên thứ 3 đã được phát hành cùng với One UI 6.1.1, ra mắt lần đầu trên bộ đôi Galaxy Z Fold6 và Galaxy Z Flip6. Tính năng này có thể sẽ được phát hành cho tất cả các điện thoại và máy tính bảng hỗ trợ tính năng Live Translate của Galaxy AI. Danh sách các thiết bị được hỗ trợ bao gồm:</p>\n\n\n\n<ul class=\"wp-block-list\">\n<li>Galaxy S22</li>\n\n\n\n<li>Galaxy S22+</li>\n\n\n\n<li>Galaxy S22 Ultra</li>\n\n\n\n<li>Galaxy S23</li>\n\n\n\n<li>Galaxy S23+</li>\n\n\n\n<li>Galaxy S23 Ultra</li>\n\n\n\n<li>Galaxy S23 FE</li>\n\n\n\n<li>Galaxy S24</li>\n\n\n\n<li>Galaxy S24+</li>\n\n\n\n<li>Galaxy S24 Ultra</li>\n\n\n\n<li>Galaxy Z Flip4</li>\n\n\n\n<li>Galaxy Z Flip5</li>\n\n\n\n<li>Galaxy Z Fold4</li>\n\n\n\n<li>Galaxy Z Fold5</li>\n\n\n\n<li>Galaxy Tab S8</li>\n\n\n\n<li>Galaxy Tab S8 Plus</li>\n\n\n\n<li>Galaxy Tab S8 Ultra</li>\n\n\n\n<li>Galaxy Tab S9</li>\n\n\n\n<li>Galaxy Tab S9 Plus</li>\n\n\n\n<li>Galaxy Tab S9 Ultra</li>\n</ul>\n\n\n\n<figure class=\"wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio\"><div class=\"wp-block-embed__wrapper\">\n<div class=\"mnmd-responsive-video\"><div class=\"fluid-width-video-wrapper\" style=\"padding-top: 56.25%;\"><iframe title=\"5 tính năng AI hữu ích trên Galaxy Z Fold6: phác họa thông minh, giải toán, vẽ biểu đồ được hết!\" src=\"https://www.youtube.com/embed/f7UTRp1YeOw?feature=oembed\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen=\"\" id=\"fitvid0\"></iframe></div></div>\n</div></figure>\n    				</div>', 350, 800, '2024-07-05 15:56:40', '2024-07-05 15:56:30', 2, 2),
(3, 'Xiaomi MIX Flip lần đầu lộ diện: Có màn hình phụ tràn viền, chạy Snapdragon 8 Gen 3 và camera Leica', 'Xiaomi-MIX-Flip.jpg', '<div class=\"single-body single-body--wide entry-content typography-copy\">\n                                                \n<p>Bên cạnh MIX Fold 4, Xiaomi mới đây cũng đã chính thức ấn định ngày ra mắt của MIX Flip, mẫu điện thoại gập dạng vỏ sò đầu tiên của hãng. Không chỉ vậy, Xiaomi còn đăng tải hình ảnh về thiết kế của MIX Flip, đồng thời xác nhận thông số kỹ thuật chính trên mẫu điện thoại gập này.</p>\n\n\n\n<p>Cụ thể, <a href=\"https://www.mi.com/index.html\" target=\"_blank\" rel=\"noopener\">Xiaomi</a> sẽ giới thiệu MIX Flip vào lúc 7 giờ tối (giờ địa phương) ngày 19 tháng 7 tại Trung Quốc, cùng với MIX Fold 4 và mẫu Redmi K70 Ultra đã được xác nhận trước đó. Về thông số kỹ thuật, Xiaomi xác nhận MIX Flip sẽ được trang bị chipset Snapdragon 8 Gen 3 và có camera được đồng phát triển với Leica. Ngoài ra, Xiaomi cũng bật mí rằng, MIX Flip sẽ có một ống kính có “khẩu độ lớn” nhưng chưa tiết lộ thêm thông số chi tiết.</p>\n\n\n<div class=\"wp-block-visual-portfolio alignwide\">\n<div class=\"vp-portfolio vp-uid-abf7559b vp-id-ZxdDpz vp-portfolio__ready\" data-vp-layout=\"tiles\" data-vp-content-source=\"images\" data-vp-items-style=\"default\" data-vp-items-click-action=\"popup_gallery\" data-vp-items-gap=\"15\" data-vp-items-gap-vertical=\"\" data-vp-pagination=\"load-more\" data-vp-next-page-url=\"\" data-vp-tiles-type=\"3|1,1|\">\n    <div class=\"vp-portfolio__preloader-wrap\">\n        <div class=\"vp-portfolio__preloader\">\n            <img data-lazyloaded=\"1\" src=\"https://vatvostudio.vn/wp-content/plugins/visual-portfolio/assets/images/logo-dark.svg\" decoding=\"async\" loading=\"eager\" data-src=\"https://vatvostudio.vn/wp-content/plugins/visual-portfolio/assets/images/logo-dark.svg\" alt=\"Visual Portfolio, Posts &amp; Image Gallery for WordPress\" width=\"20\" height=\"20\" data-skip-lazy=\"\" data-ll-status=\"loaded\" class=\"entered litespeed-loaded\"><noscript><img decoding=\"async\" loading=\"eager\" src=\"https://vatvostudio.vn/wp-content/plugins/visual-portfolio/assets/images/logo-dark.svg\" alt=\"Visual Portfolio, Posts &amp; Image Gallery for WordPress\" width=\"20\" height=\"20\" data-skip-lazy></noscript>\n        </div>\n    </div>\n        <div class=\"vp-portfolio__items-wrap\">\n            \n<div class=\"vp-portfolio__items vp-portfolio__items-style-default vp-portfolio__items-show-overlay-hover\" style=\"position: relative; height: 289.362px;\">\n\n        <div class=\"vp-portfolio__item-wrap vp-portfolio__item-uid-e5298f2a\" data-vp-filter=\"\" style=\"position: absolute; left: 0%; top: 0px;\">\n            <template class=\"vp-portfolio__item-popup\" data-vp-popup-img=\"https://vatvostudio.vn/wp-content/uploads/2024/07/Xiaomi-MIX-Flip-1.jpg\" data-vp-popup-img-srcset=\"\" data-vp-popup-img-size=\"675x900\" data-vp-popup-md-img=\"https://vatvostudio.vn/wp-content/uploads/2024/07/Xiaomi-MIX-Flip-1.jpg\" data-vp-popup-md-img-size=\"675x900\" data-vp-popup-sm-img=\"https://vatvostudio.vn/wp-content/uploads/2024/07/Xiaomi-MIX-Flip-1.jpg\" data-vp-popup-sm-img-size=\"500x667\">\n    </template>\n                        <figure class=\"vp-portfolio__item\">\n                \n<div class=\"vp-portfolio__item-img-wrap\">\n    <div class=\"vp-portfolio__item-img vp-portfolio__item-img-lazyloaded\">\n            <a href=\"https://vatvostudio.vn/wp-content/uploads/2024/07/Xiaomi-MIX-Flip-1.jpg\" data-elementor-open-lightbox=\"no\">\n    \n        <img decoding=\"async\" width=\"675\" height=\"900\" src=\"https://vatvostudio.vn/wp-content/uploads/2024/07/Xiaomi-MIX-Flip-1.jpg\" class=\"wp-image-117074 lazyautosizes ls-is-cached vp-lazyloaded\" alt=\"\" data-src=\"https://vatvostudio.vn/wp-content/uploads/2024/07/Xiaomi-MIX-Flip-1.jpg\" data-sizes=\"auto\" loading=\"eager\" sizes=\"263.325px\">\n        <div class=\"vp-portfolio__item-overlay\">\n                    </div>\n\n        </a>    </div>\n</div>\n\n<figcaption class=\"vp-portfolio__item-caption vp-portfolio__item-caption-text-align-center\">\n    </figcaption>\n            </figure>\n                    </div>\n        \n        <div class=\"vp-portfolio__item-wrap vp-portfolio__item-uid-3459b408\" data-vp-filter=\"\" style=\"position: absolute; left: 33.3333%; top: 0px;\">\n            <template class=\"vp-portfolio__item-popup\" data-vp-popup-img=\"https://vatvostudio.vn/wp-content/uploads/2024/07/Xiaomi-MIX-Flip-2.jpg\" data-vp-popup-img-srcset=\"\" data-vp-popup-img-size=\"675x900\" data-vp-popup-md-img=\"https://vatvostudio.vn/wp-content/uploads/2024/07/Xiaomi-MIX-Flip-2.jpg\" data-vp-popup-md-img-size=\"675x900\" data-vp-popup-sm-img=\"https://vatvostudio.vn/wp-content/uploads/2024/07/Xiaomi-MIX-Flip-2.jpg\" data-vp-popup-sm-img-size=\"500x667\">\n    </template>\n                        <figure class=\"vp-portfolio__item\">\n                \n<div class=\"vp-portfolio__item-img-wrap\">\n    <div class=\"vp-portfolio__item-img vp-portfolio__item-img-lazyloaded\">\n            <a href=\"https://vatvostudio.vn/wp-content/uploads/2024/07/Xiaomi-MIX-Flip-2.jpg\" data-elementor-open-lightbox=\"no\">\n    \n        <img decoding=\"async\" width=\"675\" height=\"900\" src=\"https://vatvostudio.vn/wp-content/uploads/2024/07/Xiaomi-MIX-Flip-2.jpg\" class=\"wp-image-117075 lazyautosizes ls-is-cached vp-lazyloaded\" alt=\"\" data-src=\"https://vatvostudio.vn/wp-content/uploads/2024/07/Xiaomi-MIX-Flip-2.jpg\" data-sizes=\"auto\" loading=\"eager\" sizes=\"263.325px\">\n        <div class=\"vp-portfolio__item-overlay\">\n                    </div>\n\n        </a>    </div>\n</div>\n\n<figcaption class=\"vp-portfolio__item-caption vp-portfolio__item-caption-text-align-center\">\n    </figcaption>\n            </figure>\n                    </div>\n        \n        <div class=\"vp-portfolio__item-wrap vp-portfolio__item-uid-9cb8ff2f\" data-vp-filter=\"\" style=\"position: absolute; left: 66.6667%; top: 0px;\">\n            <template class=\"vp-portfolio__item-popup\" data-vp-popup-img=\"https://vatvostudio.vn/wp-content/uploads/2024/07/Xiaomi-MIX-Flip-3.jpg\" data-vp-popup-img-srcset=\"\" data-vp-popup-img-size=\"674x900\" data-vp-popup-md-img=\"https://vatvostudio.vn/wp-content/uploads/2024/07/Xiaomi-MIX-Flip-3.jpg\" data-vp-popup-md-img-size=\"674x900\" data-vp-popup-sm-img=\"https://vatvostudio.vn/wp-content/uploads/2024/07/Xiaomi-MIX-Flip-3.jpg\" data-vp-popup-sm-img-size=\"500x668\">\n    </template>\n                        <figure class=\"vp-portfolio__item\">\n                \n<div class=\"vp-portfolio__item-img-wrap\">\n    <div class=\"vp-portfolio__item-img vp-portfolio__item-img-lazyloaded\">\n            <a href=\"https://vatvostudio.vn/wp-content/uploads/2024/07/Xiaomi-MIX-Flip-3.jpg\" data-elementor-open-lightbox=\"no\">\n    \n        <img decoding=\"async\" width=\"674\" height=\"900\" src=\"https://vatvostudio.vn/wp-content/uploads/2024/07/Xiaomi-MIX-Flip-3.jpg\" class=\"wp-image-117076 lazyautosizes ls-is-cached vp-lazyloaded\" alt=\"\" data-src=\"https://vatvostudio.vn/wp-content/uploads/2024/07/Xiaomi-MIX-Flip-3.jpg\" data-sizes=\"auto\" loading=\"eager\" sizes=\"263.325px\">\n        <div class=\"vp-portfolio__item-overlay\">\n                    </div>\n\n        </a>    </div>\n</div>\n\n<figcaption class=\"vp-portfolio__item-caption vp-portfolio__item-caption-text-align-center\">\n    </figcaption>\n            </figure>\n                    </div>\n        \n</div>\n        </div>\n        \n</div>\n</div>\n\n\n<p>Dung lượng pin của MIX Flip được cho là 4.780mAh, ngang bằng với đối thủ HONOR Magic V Flip. Ngoài ra, máy cũng sở hữu những thông số kỹ thuật ấn tượng khác như bộ nhớ UFS 4.0, RAM LPDDR5X và buồng hơi 3D hỗ trợ tản nhiệt hiệu quả. Bên cạnh đó, máy cũng có màn hình phụ 4 inch, độ phân giải 1240p và độ sáng tối đa lên tới 1.600 nits.</p>\n\n\n\n<figure class=\"wp-block-image size-full\"><img data-lazyloaded=\"1\" src=\"https://vatvostudio.vn/wp-content/uploads/2024/07/Xiaomi-MIX-Fold-4-an-dinh-ngay-ra-mat.png\" loading=\"lazy\" decoding=\"async\" width=\"1600\" height=\"900\" data-src=\"https://vatvostudio.vn/wp-content/uploads/2024/07/Xiaomi-MIX-Fold-4-an-dinh-ngay-ra-mat.png\" alt=\"\" class=\"wp-image-116998 entered litespeed-loaded\" data-ll-status=\"loaded\"><noscript><img loading=\"lazy\" loading=\"lazy\" decoding=\"async\" width=\"1600\" height=\"900\" src=\"https://vatvostudio.vn/wp-content/uploads/2024/07/Xiaomi-MIX-Fold-4-an-dinh-ngay-ra-mat.png\" alt=\"\" class=\"wp-image-116998\"/></noscript></figure>\n\n\n\n<p>Trước đó, Xiaomi đã xác nhận <a href=\"https://vatvostudio.vn/xiaomi-mix-fold-4-an-dinh-ngay-ra-mat-dong-thoi-xac-nhan-thong-so-ky-thuat-cuc-khung/\">MIX Fold 4</a> sẽ được trang bị chipset Snapdragon 8 Gen 3, đồng nghĩa với việc máy sẽ cạnh tranh với các đối thủ như vivo X Fold3 Pro, HONOR Magic V3 và Galaxy Z Fold6 tại thị trường Trung Quốc. Theo một báo cáo gần đây, phiên bản cao cấp nhất của MIX Fold 4 sẽ có 16GB RAM và bộ nhớ trong lên tới 1TB.</p>\n\n\n	<div class=\"ose-youtube wp-block-embed-youtube ose-youtube-single-video aligncenter\">\n		<div class=\"fluid-width-video-wrapper\" style=\"padding-top: 56.25%;\"><iframe src=\"https://www.youtube.com/embed/KuHvvAkqq24?controls=1&amp;fs=1&amp;iv_load_policy=3\" allowtransparency=\"true\" allowfullscreen=\"true\" frameborder=\"0\" id=\"fitvid0\">\n		</iframe></div>\n	</div>\n	\n\n\n<p></p>\n    				</div>', 200, 500, '2024-07-05 15:56:30', '2024-07-05 15:56:30', 1, 3),
(4, 'MediaTek ra mắt Dimensity 7350 cho các máy tầm trung: Hỗ trợ camera 200MP và màn 144Hz', 'MediaTek-ra-mat-chip-Dimensity-7350-cho-cac-may-tam-trung.jpg', '<div class=\"single-body single-body--wide entry-content typography-copy\">\n                                                \n<p>MediaTek vừa giới thiệu chipset Dimensity 7350 mới nhất của hãng, được thiết kế để mang đến hiệu năng mạnh mẽ cho các thiết bị tầm trung. Các điểm nổi bật trên Dimensity 7350 có thể kể đến như hỗ trợ camera 200MP, tần số quét lên tới 144Hz ở độ phân giải Full HD+, được sản xuất trên tiến trình 4nm, hỗ trợ cả RAM LPDDR5 và LPDDR4X, v.v.</p>\n\n\n\n<p>Cụ thể, chip Dimensity 7350 có cấu trúc 8 lõi và được xây dựng trên tiến trình sản xuất 4nm thế hệ thứ 2 của TSMC. Chipset này bao gồm các nhân xử lý Armv9 thế hệ thứ 2, có thể đạt tốc độ lên đến 3.0 GHz, cùng với GPU Mali G610 MC4 để đảm nhiệm các tác vụ liên quan đến đồ họa.</p>\n\n\n\n<figure class=\"wp-block-image size-full\"><img data-lazyloaded=\"1\" src=\"https://vatvostudio.vn/wp-content/uploads/2024/07/image-28.png\" fetchpriority=\"high\" decoding=\"async\" width=\"696\" height=\"945\" data-src=\"https://vatvostudio.vn/wp-content/uploads/2024/07/image-28.png\" alt=\"\" class=\"wp-image-117081 entered litespeed-loaded\" data-ll-status=\"loaded\"><noscript><img fetchpriority=\"high\" fetchpriority=\"high\" decoding=\"async\" width=\"696\" height=\"945\" src=\"https://vatvostudio.vn/wp-content/uploads/2024/07/image-28.png\" alt=\"\" class=\"wp-image-117081\"/></noscript></figure>\n\n\n\n<p>Trong đó, Dimensity 7350 sở hữu 2 lõi Cortex-A715 và 6 lõi Cortex-A510. Đối với các tác vụ AI, chipset được tích hợp bộ xử lý NPU 657 của MediaTek. Chipset này cũng được trang bị bộ xử lý hình ảnh Imagiq 765, hỗ trợ hình ảnh HDR 14 bit. Thậm chí, nó còn có thể xử lý cảm biến camera lên đến 200MP và quay video ở độ phân giải 4K@30 FPS. Ngoài ra, Dimensity 7350 cũng hỗ trợ cả RAM LPDDR5 và LPDDR4x.</p>\n\n\n\n<figure class=\"wp-block-image size-full\"><img data-lazyloaded=\"1\" src=\"data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7\" decoding=\"async\" width=\"1600\" height=\"900\" data-src=\"https://vatvostudio.vn/wp-content/uploads/2024/07/MediaTek-ra-mat-chip-Dimensity-7350-cho-cac-may-tam-trung.jpg\" alt=\"\" class=\"wp-image-117080\"><noscript><img decoding=\"async\" width=\"1600\" height=\"900\" src=\"https://vatvostudio.vn/wp-content/uploads/2024/07/MediaTek-ra-mat-chip-Dimensity-7350-cho-cac-may-tam-trung.jpg\" alt=\"\" class=\"wp-image-117080\"/></noscript></figure>\n\n\n\n<p>Thêm vào đó, Dimensity 7350 còn tích hợp modem 5G chuẩn R16 cho tốc độ mạng lên tới 4.7Gbps, hỗ trợ Wi-Fi 6E ba băng tần 2×2 ăng-ten và công nghệ tiết kiệm điện năng MediaTek 5G UltraSave 2.0. Tất nhiên, vì là bộ vi xử lý tầm trung, Dimensity 7350 cũng có một số hạn chế, chẳng hạn như nó chỉ hỗ trợ màn hình Full HD+ ở tần số quét 144Hz và sử dụng bộ nhớ UFS 3.1. Tính đến thời điểm hiện tại, vẫn chưa có bất kỳ thông tin nào về thiết bị đầu tiên sẽ được trang bị chip Dimensity 7350.                                       </p>\n\n\n	<div class=\"ose-youtube wp-block-embed-youtube ose-youtube-single-video aligncenter\">\n		<div class=\"fluid-width-video-wrapper\" style=\"padding-top: 56.25%;\"><iframe src=\"https://www.youtube.com/embed/HcDfkXbhuEk?controls=1&amp;fs=1&amp;iv_load_policy=3\" allowtransparency=\"true\" allowfullscreen=\"true\" frameborder=\"0\" id=\"fitvid0\">\n		</iframe></div>\n	</div>\n	\n\n\n<p></p>\n    				</div>', 400, 950, '2024-07-05 15:56:30', '2024-07-05 15:56:30', 3, 4),
(5, 'Xiaomi mở bán ô điện thông minh: Đóng mở bằng điện, có cả cổng USB-C và kháng nước IPX4, giá khoảng 450K', 'Xiaomi-mo-ban-o-dien-thong-minh.jpg', '<div class=\"single-body single-body--wide entry-content typography-copy\">\n                                                \n<p>Mới đây, nền tảng gọi vốn Xiaomi Youpin đã ra mắt ô điện thông minh Risetime, có khả năng tự động đóng mở chỉ trong vòng 2 giây chỉ bằng một nút bấm. Nằm trên tay cầm của ô là hai nút bấm riêng biệt, giúp  người dùng dễ dàng thao tác đóng mở.</p>\n\n\n\n<p>Điểm nổi bật của chiếc ô thông minh Risetime chính là khả năng đóng mở nhanh chóng chỉ với một thao tác, đặc biệt hữu ích trong những ngày mưa. Được biết, ô điện thông minh Risetime được trang bị viên pin có dung lượng 280mAh, đóng mở lên tới 150 lần. Đáng chú ý, thời gian chờ của chiếc ô này có thể lên đến 180 ngày, đủ để người dùng sử dụng trong suốt mùa mưa mà không cần sạc lại. Và khi hết pin, người dùng cũng chỉ mất 1,5 giờ để có thể sạc đầy viên pin của ô thông qua cổng USB-C.</p>\n\n\n\n<figure class=\"wp-block-image size-full\"><img data-lazyloaded=\"1\" src=\"https://vatvostudio.vn/wp-content/uploads/2024/07/Xiaomi-mo-ban-o-dien-thong-minh-2.jpg\" fetchpriority=\"high\" decoding=\"async\" width=\"1280\" height=\"960\" data-src=\"https://vatvostudio.vn/wp-content/uploads/2024/07/Xiaomi-mo-ban-o-dien-thong-minh-2.jpg\" alt=\"\" class=\"wp-image-117087 entered litespeed-loaded\" data-ll-status=\"loaded\"><noscript><img fetchpriority=\"high\" fetchpriority=\"high\" decoding=\"async\" width=\"1280\" height=\"960\" src=\"https://vatvostudio.vn/wp-content/uploads/2024/07/Xiaomi-mo-ban-o-dien-thong-minh-2.jpg\" alt=\"\" class=\"wp-image-117087\"/></noscript></figure>\n\n\n<div class=\"wp-block-visual-portfolio alignwide\">\n<div class=\"vp-portfolio vp-uid-3f9c845d vp-id-Z6dKbz vp-portfolio__ready\" data-vp-layout=\"tiles\" data-vp-content-source=\"images\" data-vp-items-style=\"default\" data-vp-items-click-action=\"popup_gallery\" data-vp-items-gap=\"15\" data-vp-items-gap-vertical=\"\" data-vp-pagination=\"load-more\" data-vp-next-page-url=\"\" data-vp-tiles-type=\"2|1,1|\">\n    <div class=\"vp-portfolio__preloader-wrap\">\n        <div class=\"vp-portfolio__preloader\">\n            <img data-lazyloaded=\"1\" src=\"data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7\" decoding=\"async\" loading=\"eager\" data-src=\"https://vatvostudio.vn/wp-content/plugins/visual-portfolio/assets/images/logo-dark.svg\" alt=\"Visual Portfolio, Posts &amp; Image Gallery for WordPress\" width=\"20\" height=\"20\" data-skip-lazy=\"\"><noscript><img decoding=\"async\" loading=\"eager\" src=\"https://vatvostudio.vn/wp-content/plugins/visual-portfolio/assets/images/logo-dark.svg\" alt=\"Visual Portfolio, Posts &amp; Image Gallery for WordPress\" width=\"20\" height=\"20\" data-skip-lazy></noscript>\n        </div>\n    </div>\n        <div class=\"vp-portfolio__items-wrap\">\n            \n<div class=\"vp-portfolio__items vp-portfolio__items-style-default vp-portfolio__items-show-overlay-hover\" style=\"position: relative; height: 428.538px;\">\n\n        <div class=\"vp-portfolio__item-wrap vp-portfolio__item-uid-6b07dfce\" data-vp-filter=\"\" style=\"position: absolute; left: 0%; top: 0px;\">\n            <template class=\"vp-portfolio__item-popup\" data-vp-popup-img=\"https://vatvostudio.vn/wp-content/uploads/2024/07/Xiaomi-mo-ban-o-dien-thong-minh-1.jpg\" data-vp-popup-img-srcset=\"\" data-vp-popup-img-size=\"1339x1344\" data-vp-popup-md-img=\"https://vatvostudio.vn/wp-content/uploads/2024/07/Xiaomi-mo-ban-o-dien-thong-minh-1.jpg\" data-vp-popup-md-img-size=\"800x803\" data-vp-popup-sm-img=\"https://vatvostudio.vn/wp-content/uploads/2024/07/Xiaomi-mo-ban-o-dien-thong-minh-1.jpg\" data-vp-popup-sm-img-size=\"500x502\">\n    </template>\n                        <figure class=\"vp-portfolio__item\">\n                \n<div class=\"vp-portfolio__item-img-wrap\">\n    <div class=\"vp-portfolio__item-img vp-portfolio__item-img-lazyloaded\">\n            <a href=\"https://vatvostudio.vn/wp-content/uploads/2024/07/Xiaomi-mo-ban-o-dien-thong-minh-1.jpg\">\n    \n        <img decoding=\"async\" width=\"1339\" height=\"1344\" src=\"https://vatvostudio.vn/wp-content/uploads/2024/07/Xiaomi-mo-ban-o-dien-thong-minh-1.jpg\" class=\"wp-image-117088 lazyautosizes vp-lazyloaded\" alt=\"\" data-src=\"https://vatvostudio.vn/wp-content/uploads/2024/07/Xiaomi-mo-ban-o-dien-thong-minh-1.jpg\" data-sizes=\"auto\" loading=\"eager\" sizes=\"402.5px\">\n        <div class=\"vp-portfolio__item-overlay\">\n                    </div>\n\n        </a>    </div>\n</div>\n\n<figcaption class=\"vp-portfolio__item-caption vp-portfolio__item-caption-text-align-center\">\n    </figcaption>\n            </figure>\n                    </div>\n        \n        <div class=\"vp-portfolio__item-wrap vp-portfolio__item-uid-ba77e4ec\" data-vp-filter=\"\" style=\"position: absolute; left: 50%; top: 0px;\">\n            <template class=\"vp-portfolio__item-popup\" data-vp-popup-img=\"https://vatvostudio.vn/wp-content/uploads/2024/07/Xiaomi-mo-ban-o-dien-thong-minh-3.jpg\" data-vp-popup-img-srcset=\"\" data-vp-popup-img-size=\"600x713\" data-vp-popup-md-img=\"https://vatvostudio.vn/wp-content/uploads/2024/07/Xiaomi-mo-ban-o-dien-thong-minh-3.jpg\" data-vp-popup-md-img-size=\"600x713\" data-vp-popup-sm-img=\"https://vatvostudio.vn/wp-content/uploads/2024/07/Xiaomi-mo-ban-o-dien-thong-minh-3.jpg\" data-vp-popup-sm-img-size=\"500x594\">\n    </template>\n                        <figure class=\"vp-portfolio__item\">\n                \n<div class=\"vp-portfolio__item-img-wrap\">\n    <div class=\"vp-portfolio__item-img vp-portfolio__item-img-lazyloaded\">\n            <a href=\"https://vatvostudio.vn/wp-content/uploads/2024/07/Xiaomi-mo-ban-o-dien-thong-minh-3.jpg\">\n    \n        <img decoding=\"async\" width=\"600\" height=\"713\" src=\"https://vatvostudio.vn/wp-content/uploads/2024/07/Xiaomi-mo-ban-o-dien-thong-minh-3.jpg\" class=\"wp-image-117089 lazyautosizes vp-lazyloaded\" alt=\"\" data-src=\"https://vatvostudio.vn/wp-content/uploads/2024/07/Xiaomi-mo-ban-o-dien-thong-minh-3.jpg\" data-sizes=\"auto\" loading=\"eager\" sizes=\"402.5px\">\n        <div class=\"vp-portfolio__item-overlay\">\n                    </div>\n\n        </a>    </div>\n</div>\n\n<figcaption class=\"vp-portfolio__item-caption vp-portfolio__item-caption-text-align-center\">\n    </figcaption>\n            </figure>\n                    </div>\n        \n</div>\n        </div>\n        \n</div>\n</div>\n\n\n<p>Để đảm bảo an toàn trong quá trình sử dụng, Risetime đã trang bị cho chiếc ô điện thông minh này một số tính năng an toàn. Khi hết pin, ô chỉ có thể được thu gọn tự động và không thể mở thủ công. Người dùng cần sạc pin cho ô để có thể sử dụng lại bình thường. </p>\n\n\n\n<p>Theo Risetime, thiết kế của ô đã được nghiên cứu kỹ lưỡng để đảm bảo hiệu suất hoạt động và sự an toàn. Cơ chế đóng mở đảo ngược giúp bề mặt ướt của ô được giấu vào bên trong khi gấp gọn. Tay cầm của ô cũng được có khả năng kháng nước đạt chuẩn IPX4.</p>\n\n\n\n<figure class=\"wp-block-image size-full\"><img data-lazyloaded=\"1\" src=\"data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7\" loading=\"lazy\" decoding=\"async\" width=\"1600\" height=\"900\" data-src=\"https://vatvostudio.vn/wp-content/uploads/2024/07/Xiaomi-mo-ban-o-dien-thong-minh.jpg\" alt=\"\" class=\"wp-image-117086\"><noscript><img loading=\"lazy\" loading=\"lazy\" decoding=\"async\" width=\"1600\" height=\"900\" src=\"https://vatvostudio.vn/wp-content/uploads/2024/07/Xiaomi-mo-ban-o-dien-thong-minh.jpg\" alt=\"\" class=\"wp-image-117086\"/></noscript></figure>\n\n\n\n<p>Ngoài ra, ô điện thông minh Risetime còn có khả năng chống tia cực tím (UV) lên đến 99%, đạt chứng nhận chống nắng UPF50+. Khung ô được làm từ hợp kim nhôm hàng không, có khả năng chịu gió cấp 5. Mép ô được thiết kế phản quang, giúp tăng cường an toàn khi di chuyển vào ban đêm hoặc trời mưa.</p>\n\n\n\n<p><strong>Cần lưu ý rằng Risetime là thương hiệu thứ ba và không thuộc sở hữu của Xiaomi. Giá gây quỹ cộng đồng của chiếc ô này là 129 tệ (khoảng 450 nghìn đồng).</strong></p>\n\n\n\n<figure class=\"wp-block-embed is-type-wp-embed is-provider-v-t-v-studio-vvs-tin-t-c-v-nh-gi-s-n-ph-m-c-ng-ngh wp-block-embed-v-t-v-studio-vvs-tin-t-c-v-nh-gi-s-n-ph-m-c-ng-ngh\"><div class=\"wp-block-embed__wrapper\">\n<blockquote class=\"wp-embedded-content\" data-secret=\"HXGr4VCyQH\" style=\"display: none;\"><a href=\"https://vatvostudio.vn/xiaomi-am-tham-ra-mat-hai-mau-loa-bluetooth-o-thi-truong-quoc-te-gia-tu-762-nghin-dong/\">Xiaomi âm thầm ra mắt hai mẫu loa Bluetooth ở thị trường quốc tế, giá từ 762 nghìn đồng</a></blockquote><iframe class=\"wp-embedded-content\" sandbox=\"allow-scripts\" security=\"restricted\" title=\"“Xiaomi âm thầm ra mắt hai mẫu loa Bluetooth ở thị trường quốc tế, giá từ 762 nghìn đồng” — Vật Vờ Studio - VVS - Tin tức và đánh giá sản phẩm công nghệ\" src=\"https://vatvostudio.vn/xiaomi-am-tham-ra-mat-hai-mau-loa-bluetooth-o-thi-truong-quoc-te-gia-tu-762-nghin-dong/embed/#?secret=nu6Q2JyLFe#?secret=HXGr4VCyQH\" data-secret=\"HXGr4VCyQH\" width=\"600\" height=\"326\" frameborder=\"0\" marginwidth=\"0\" marginheight=\"0\" scrolling=\"no\"></iframe>\n</div></figure>\n    				</div>', 600, 1500, '2024-07-05 15:56:30', '2024-07-05 15:56:30', 5, 5),
(6, 'Thị trường smartphone toàn cầu tăng trưởng trong quý thứ ba liên tiếp: Samsung vẫn dẫn đầu, Xiaomi hưởng lợi nhiều nhất', 'Thi-truong-smartphone-toan-cau-tang-truong-quy-thu-ba-lien-tiep-6.jpg', '<div class=\"single-body single-body--wide entry-content typography-copy\">\n                                                \n<p>Theo nghiên cứu mới nhất của <em>Canalys</em>, thị trường smartphone toàn cầu đã ghi nhận quý tăng trưởng thứ ba liên tiếp với mức tăng trưởng 12% trong quý 2 năm 2024, đạt 288 triệu chiếc.</p>\n\n\n\n<p>Cụ thể, <a href=\"http://samsung.com/\" target=\"_blank\" rel=\"noopener\">Samsung</a> tiếp tục dẫn đầu thị trường toàn cầu với 18% thị phần, nhờ việc tập trung vào phân khúc cao cấp. Apple bám sát với 16% thị phần, đứng thứ vị trí thứ 2. Đáng chú ý, Xiaomi là hãng có mức tăng trưởng ấn tượng nhất trong top 5, có mức tăng trưởng hàng năm đạt 27% và chiếm 15% thị phần. Kế tiếp là vivo đứng vị trí thứ 4 trên toàn cầu với 9% thị phần và TRANSSION chiếm vị trí thứ 5, cũng với 9% thị phần.</p>\n\n\n\n<figure class=\"wp-block-image size-full\"><img data-lazyloaded=\"1\" src=\"https://vatvostudio.vn/wp-content/uploads/2024/07/Thi-truong-smartphone-toan-cau-tang-truong-quy-thu-ba-lien-tiep.jpg\" fetchpriority=\"high\" decoding=\"async\" width=\"1600\" height=\"900\" data-src=\"https://vatvostudio.vn/wp-content/uploads/2024/07/Thi-truong-smartphone-toan-cau-tang-truong-quy-thu-ba-lien-tiep.jpg\" alt=\"\" class=\"wp-image-117062 entered litespeed-loaded\" data-ll-status=\"loaded\"><noscript><img fetchpriority=\"high\" fetchpriority=\"high\" decoding=\"async\" width=\"1600\" height=\"900\" src=\"https://vatvostudio.vn/wp-content/uploads/2024/07/Thi-truong-smartphone-toan-cau-tang-truong-quy-thu-ba-lien-tiep.jpg\" alt=\"\" class=\"wp-image-117062\"/></noscript></figure>\n\n\n\n<p>Theo các chuyên gia <em>Canalys</em>, sự lạc quan trên thị trường smartphone đến từ việc lạm phát được kiểm soát tại nhiều thị trường mới nổi và nhu cầu mua sắm đã tăng trở lại, đặc biệt là ở phân khúc giá rẻ. Bên cạnh đó, những công nghệ mới như trí tuệ nhân tạo cũng là động lực thúc đẩy người dùng “lên đời” smartphone. </p>\n\n\n\n<p>Bà Amber Liu, Giám đốc nghiên cứu tại <em>Canalys </em>cho biết, các công ty, bao gồm <a href=\"https://vatvostudio.vn/?s=Xiaomi\">Xiaomi</a> và TRANSSION, đang tích cực thúc đẩy nâng cấp sản phẩm để tận dụng những cơ hội này. Trong khi đó, HONOR, OPPO và vivo đang tập trung mở rộng sang các thị trường bên ngoài Trung Quốc trong năm nay do sự cạnh tranh tại thị trường nội địa đang ngày càng gia tăng.</p>\n\n\n\n<figure class=\"wp-block-image size-full\"><img data-lazyloaded=\"1\" src=\"data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7\" decoding=\"async\" width=\"1600\" height=\"900\" data-src=\"https://vatvostudio.vn/wp-content/uploads/2024/07/Thi-truong-smartphone-toan-cau-tang-truong-quy-thu-ba-lien-tiep-1.jpg\" alt=\"\" class=\"wp-image-117063\"><noscript><img decoding=\"async\" width=\"1600\" height=\"900\" src=\"https://vatvostudio.vn/wp-content/uploads/2024/07/Thi-truong-smartphone-toan-cau-tang-truong-quy-thu-ba-lien-tiep-1.jpg\" alt=\"\" class=\"wp-image-117063\"/></noscript></figure>\n\n\n\n<p>Ở phân khúc cao cấp, cuộc đua vẫn là màn so găng giữa Samsung và Apple. Trong đó, Samsung gây ấn tượng với dòng Galaxy Z Fold6 và Galaxy Flip6 với việc tích hợp nhiều tính năng AI mới. Đối với Apple, mặc dù chưa ra mắt sản phẩm mới, nhưng hãng cũng tạo được cú hích lớn sau sự kiện WWDC 2024 với những công nghệ đột phá, hứa hẹn tạo nên thế hệ iPhone mới mạnh mẽ hơn.</p>\n\n\n\n<p class=\"has-text-align-center\"><strong>Thị phần smartphone toàn cầu trong Quý 2/2024 theo Canalys</strong></p>\n\n\n\n<figure class=\"wp-block-table\"><table class=\"has-fixed-layout\"><tbody><tr><td class=\"has-text-align-center\" data-align=\"center\"><strong>Thương hiệu</strong></td><td class=\"has-text-align-center\" data-align=\"center\"><strong>Thị phần Q2 2024</strong></td><td class=\"has-text-align-center\" data-align=\"center\"><strong>Thị phần Q2 2023</strong></td></tr><tr><td class=\"has-text-align-center\" data-align=\"center\">Samsung</td><td class=\"has-text-align-center\" data-align=\"center\">18%</td><td class=\"has-text-align-center\" data-align=\"center\">21%</td></tr><tr><td class=\"has-text-align-center\" data-align=\"center\">Apple</td><td class=\"has-text-align-center\" data-align=\"center\">16%</td><td class=\"has-text-align-center\" data-align=\"center\">17%</td></tr><tr><td class=\"has-text-align-center\" data-align=\"center\">Xiaomi</td><td class=\"has-text-align-center\" data-align=\"center\">15%</td><td class=\"has-text-align-center\" data-align=\"center\">13%</td></tr><tr><td class=\"has-text-align-center\" data-align=\"center\">vivo</td><td class=\"has-text-align-center\" data-align=\"center\">9%</td><td class=\"has-text-align-center\" data-align=\"center\">8%</td></tr><tr><td class=\"has-text-align-center\" data-align=\"center\">TRANSSION</td><td class=\"has-text-align-center\" data-align=\"center\">9%</td><td class=\"has-text-align-center\" data-align=\"center\">9%</td></tr><tr><td class=\"has-text-align-center\" data-align=\"center\">Khác</td><td class=\"has-text-align-center\" data-align=\"center\">33%</td><td class=\"has-text-align-center\" data-align=\"center\">33%</td></tr></tbody></table></figure>\n\n\n\n<p></p>\n\n\n	<div class=\"ose-youtube wp-block-embed-youtube ose-youtube-single-video aligncenter\">\n		<div class=\"fluid-width-video-wrapper\" style=\"padding-top: 56.25%;\"><iframe src=\"https://www.youtube.com/embed/8dkDhOhkRxI?controls=1&amp;fs=1&amp;iv_load_policy=3\" allowtransparency=\"true\" allowfullscreen=\"true\" frameborder=\"0\" id=\"fitvid0\">\n		</iframe></div>\n	</div>\n	    				</div>', 300, 1000, '2024-07-19 02:47:02', '2024-07-19 02:47:02', 1, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `posts_tags`
--

CREATE TABLE `posts_tags` (
  `id` int NOT NULL,
  `id_post` int NOT NULL,
  `id_tag` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `posts_tags`
--

INSERT INTO `posts_tags` (`id`, `id_post`, `id_tag`) VALUES
(1, 1, 2),
(2, 1, 2),
(3, 2, 1),
(4, 2, 1),
(5, 3, 5),
(6, 4, 3),
(7, 5, 4),
(8, 4, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tags`
--

CREATE TABLE `tags` (
  `id` int NOT NULL,
  `tag_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `tags`
--

INSERT INTO `tags` (`id`, `tag_name`) VALUES
(1, 'iOS'),
(2, 'Android'),
(3, 'Laptop'),
(4, 'Điện thoại'),
(5, 'Windows');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `number_phone` (`number_phone`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_comments_posts` (`id_post`),
  ADD KEY `fk_comments_authors` (`id_author`);

--
-- Chỉ mục cho bảng `image_gallery`
--
ALTER TABLE `image_gallery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_image-gallery_posts` (`id_post`);

--
-- Chỉ mục cho bảng `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_posts_categories` (`id_category`),
  ADD KEY `fk_posts_authors` (`id_author`);

--
-- Chỉ mục cho bảng `posts_tags`
--
ALTER TABLE `posts_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_posts-tags_posts` (`id_post`),
  ADD KEY `fk_posts-tags_tags` (`id_tag`);

--
-- Chỉ mục cho bảng `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `authors`
--
ALTER TABLE `authors`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `image_gallery`
--
ALTER TABLE `image_gallery`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `posts_tags`
--
ALTER TABLE `posts_tags`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_comments_authors` FOREIGN KEY (`id_author`) REFERENCES `authors` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_comments_posts` FOREIGN KEY (`id_post`) REFERENCES `posts` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `image_gallery`
--
ALTER TABLE `image_gallery`
  ADD CONSTRAINT `fk_image-gallery_posts` FOREIGN KEY (`id_post`) REFERENCES `posts` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `fk_posts_authors` FOREIGN KEY (`id_author`) REFERENCES `authors` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_posts_categories` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `posts_tags`
--
ALTER TABLE `posts_tags`
  ADD CONSTRAINT `fk_posts-tags_posts` FOREIGN KEY (`id_post`) REFERENCES `posts` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_posts-tags_tags` FOREIGN KEY (`id_tag`) REFERENCES `tags` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
