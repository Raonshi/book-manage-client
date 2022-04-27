import 'package:flutter/material.dart';

class BooksPage extends StatelessWidget {
  const BooksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        children: [
          TextFormField(
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
            child: ListView.builder(
              itemCount: 50,
              itemBuilder: (context, index) => ListTile(
                title: Text('Book Title'),
                subtitle: Text('Book author'),
                leading: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer),
                  child: Text('Book Image'),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
