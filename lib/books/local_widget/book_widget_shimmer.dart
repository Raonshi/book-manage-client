import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BookWdigetShimmer extends StatelessWidget {
  const BookWdigetShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
        title: Container(
          height: 16,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
        subtitle: Container(
          height: 16,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
      ),
      baseColor: Theme.of(context).colorScheme.surface,
      highlightColor: Theme.of(context).dividerColor,
    );
  }
}
