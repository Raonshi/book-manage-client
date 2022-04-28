import 'package:book_manager/books/book_detail/book_detail_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookDetailPage extends GetView<BookDetailCtrl> {
  const BookDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.book = Get.arguments;

    return Scaffold(
      appBar: AppBar(title: Text(controller.book?['title'] ?? '')),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildBookImage(),
            const Divider(
              height: 10,
              thickness: 2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: Text(
                      'TITLE',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  Text(
                    controller.book?['title'] ?? '',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: Text(
                      'AUTHOR',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  Text(
                    controller.book?['author'] ?? '',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: Text(
                      'PRICE',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  Text(
                    'USD ${controller.book?['price'] ?? ''}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: Text(
                      'REMAIN',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  Obx(
                    () => Text(
                      '${controller.book!['count'] - controller.book!['lent']}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Get.size.height * 0.2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 75,
                  margin: const EdgeInsets.only(right: 30),
                  child: ElevatedButton(
                    onPressed: () =>
                        controller.book?['lent'] >= controller.book?['count']
                            ? Get.defaultDialog(
                                title: 'Info',
                                content: const Text('There is no book'),
                                onCancel: () {},
                              )
                            : controller.lentBook(),
                    child: const Text('Lent'),
                  ),
                ),
                Container(
                  width: 75,
                  margin: const EdgeInsets.only(left: 30),
                  child: ElevatedButton(
                    onPressed: () => controller.book?['lent'] == 0
                        ? Get.defaultDialog(
                            title: 'Info',
                            content: const Text('The book has returned fully'),
                            onCancel: () {},
                          )
                        : controller.returnBook(),
                    child: const Text('Return'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //TODO: temp function
  _buildBookImage() => Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        height: 300,
        width: 240,
        decoration: const BoxDecoration(
          color: Colors.amber,
        ),
        child: const Center(
          child: Text('Book Image'),
        ),
      );
}
