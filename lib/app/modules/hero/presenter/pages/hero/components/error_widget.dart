import 'package:flutter/material.dart';

class MyErrorWidget extends StatelessWidget {
  final String? error;

  const MyErrorWidget({Key? key, required this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        error ?? '',
        style:
            Theme.of(context).textTheme.subtitle1?.copyWith(color: Theme.of(context).colorScheme.secondary),
      ),
    );
  }
}
