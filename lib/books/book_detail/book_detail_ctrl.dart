import 'package:get/get.dart';

class BookDetailCtrl extends GetxController {
  final _book = Rxn<Map<String, dynamic>>();
  Map<String, dynamic>? get book => _book.value;
  set book(Map<String, dynamic>? val) => _book.value = val;
}
