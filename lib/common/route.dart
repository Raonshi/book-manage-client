import 'package:book_manager/books/book_detail/book_detail_binding.dart';
import 'package:book_manager/books/book_detail/book_detail_page.dart';
import 'package:get/get.dart';

List<GetPage> routes = [
  GetPage(
      name: '/book_detail',
      page: () => BookDetailPage(),
      binding: BookDetailBinding()),
];
