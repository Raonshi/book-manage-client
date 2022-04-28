import 'dart:async';

import 'package:book_manager/books/books_repository.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class BooksCtrl extends GetxController {
  final _isLoad = true.obs;
  get isLoad => _isLoad.value;
  set isLoad(val) => _isLoad.value = val;

  final _keyword = ''.obs;
  String get keyword => _keyword.value;
  set keyword(String val) => _keyword.value = val;

  final _books = [].obs;
  get books => _books;

  final _searchedBooks = [].obs;
  get searchedBooks => _searchedBooks;

  Timer? debounce;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();

    List<Map<String, dynamic>> list =
        await BooksRepository().fetchTestBookData();
    books.addAll(list);
    searchedBooks.clear();
    searchedBooks.addAll(books);
  }

  searchBook() async {
    searchedBooks.clear();
    String searchText = keyword.toLowerCase().replaceAll(' ', '');
    if (searchText == '') {
      searchedBooks.addAll(books);
      return;
    }

    Logger().d(searchText);

    List result = books.where(
      (book) {
        final String title = book['title'];
        final String author = book['author'];

        Logger().d(title);
        return title.toLowerCase().replaceAll(' ', '').contains(searchText) ||
            author.toLowerCase().replaceAll(' ', '').contains(searchText);
      },
    ).toList();

    result.isEmpty ? searchedBooks.addAll(books) : searchedBooks.addAll(result);

    return searchedBooks;
  }
}
