import 'package:get/get.dart';

class HomeCtrl extends GetxController {
  final _currentButtonIndex = 0.obs;
  get currentButtonIndex => _currentButtonIndex.value;
  set currentButtonIndex(val) => _currentButtonIndex.value = val;
}
