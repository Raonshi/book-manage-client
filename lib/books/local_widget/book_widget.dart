import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookWidget extends StatelessWidget {
  const BookWidget({Key? key, required this.book}) : super(key: key);

  final Map<String, dynamic> book;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 8.0),
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer),
            child: Text('Book Image'),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(book['title'],
                    style: Theme.of(context).textTheme.bodyMedium),
                Text(
                  book['author'],
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: 'Remain ',
                          style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(
                          text: book['remain'].toString(),
                          style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios),
        ],
      ),
      onTap: () => Get.toNamed('book_detail', arguments: book),
    );
  }
}
