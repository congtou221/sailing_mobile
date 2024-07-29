import 'package:flutter/material.dart';

class SailingHeadlineSmall extends StatelessWidget {
  final String text;

  const SailingHeadlineSmall({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headlineSmall,
    );
  }
}
