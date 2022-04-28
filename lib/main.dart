import 'package:book_manager/common/route.dart';
import 'package:book_manager/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePage(),
      getPages: routes,
      builder: ((context, child) {
        return child!;
      }),
    );
  }
}
