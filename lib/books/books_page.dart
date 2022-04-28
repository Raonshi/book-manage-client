import 'package:book_manager/books/books_ctrl.dart';
import 'package:book_manager/books/local_widget/book_widget.dart';
import 'package:book_manager/books/local_widget/book_widget_shimmer.dart';
import 'package:book_manager/common/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class BooksPage extends StatelessWidget {
  BooksPage({Key? key}) : super(key: key);

  final controller = Get.put(BooksCtrl());

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        children: [
          TextFormField(
            controller: textEditingController,
            onChanged: (_) {
              controller.keyword = textEditingController.text;

              debouncer(controller.debounce, () {
                controller.searchBook();
              });
            },
            decoration: InputDecoration(
              hintText: 'Book name & Author name',
              contentPadding: const EdgeInsets.symmetric(
                vertical: 3.0,
                horizontal: 6.0,
              ),
              border: const OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.primary),
              ),
              suffixIcon: IconButton(
                onPressed: () {},
                iconSize: 16,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: const Icon(Icons.clear),
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: controller.searchedBooks.length,
                itemBuilder: (context, index) => controller.isLoad
                    ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child:
                            BookWidget(book: controller.searchedBooks[index]),
                      )
                    : BookWdigetShimmer(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
