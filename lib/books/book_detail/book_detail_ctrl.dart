import 'package:book_manager/books/books_ctrl.dart';
import 'package:get/get.dart';

class BookDetailCtrl extends GetxController {
  final _book = Rxn<Map<String, dynamic>>();
  Map<String, dynamic>? get book => _book.value;
  set book(Map<String, dynamic>? val) => _book.value = val;

  lentBook() {
    int lent =
        book?['count'] <= book?['lent'] ? book!['lent'] + 1 : book!['lent'];

    final Map<String, dynamic> updatedBook = {
      'id': book?['id'] ?? 00000,
      "title": book?['title'] ?? '-',
      "author": book?['author'] ?? '-',
      "year_written": book?['year_written'] ?? 2022,
      "edition": book?['edition'] ?? '-',
      "price": book?['price'] ?? 0.0,
      "count": book?['count'] ?? 0,
      "lent": lent,
    };

    final bool isUpdated = Get.find<BooksCtrl>().updateBookInfo(updatedBook);
    book = isUpdated ? updatedBook : book;
  }

  returnBook() {
    int lent = book?['lent'] == 0 ? book!['lent'] : book!['lent'] - 1;
    final Map<String, dynamic> updatedBook = {
      'id': book?['id'] ?? 00000,
      "title": book?['title'] ?? '-',
      "author": book?['author'] ?? '-',
      "year_written": book?['year_written'] ?? 2022,
      "edition": book?['edition'] ?? '-',
      "price": book?['price'] ?? 0.0,
      "count": book?['count'] ?? 0,
      "lent": lent,
    };

    final bool isUpdated = Get.find<BooksCtrl>().updateBookInfo(updatedBook);
    book = isUpdated ? updatedBook : book;
  }
}
