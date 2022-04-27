import 'package:book_manager/account/account_page.dart';
import 'package:book_manager/books/books_page.dart';
import 'package:book_manager/home/home_ctrl.dart';
import 'package:book_manager/lent/lent_page.dart';
import 'package:book_manager/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final controller = Get.put(HomeCtrl());
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Book Manager')),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: <Widget>[
          BooksPage(),
          LentPage(),
          AccountPage(),
          SettingsPage(),
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.blue,
          showUnselectedLabels: true,
          currentIndex: controller.currentButtonIndex,
          onTap: (index) {
            controller.currentButtonIndex = index;
            pageController.jumpToPage(index);
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Books',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shop),
              label: 'Lent',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Account',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
