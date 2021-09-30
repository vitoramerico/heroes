import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Nenhum registro encontrado',
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
