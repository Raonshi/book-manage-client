import 'package:book_manager/common/data.dart';

class BooksRepository {
  Future<List<Map<String, dynamic>>> fetchTestBookData() async {
    return bookData;
  }
}
