import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DescriptionWidget extends StatelessWidget {
  final String title;
  final String value;

  const DescriptionWidget({Key? key, required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const SizedBox(width: 5),
          Flexible(
            child: Text(
              value,
              style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.grey[700]),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
