import 'package:book_manager/books/book_detail/book_detail_ctrl.dart';
import 'package:get/get.dart';

class BookDetailBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(BookDetailCtrl());
  }
}
