import 'package:flutter/material.dart';
import 'package:heroes/app/modules/hero/domain/entities/hero_appearance_entity.dart';
import 'package:heroes/app/modules/hero/domain/entities/hero_work_entity.dart';

import 'description_widget.dart';

class WorkWidget extends StatelessWidget {
  final HeroWorkEntity work;

  const WorkWidget({Key? key, required this.work}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'Trabalho',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 8),
            DescriptionWidget(
              title: 'Ocupação:',
              value: work.occupation,
            ),
            DescriptionWidget(
              title: 'Local:',
              value: work.base,
            ),
          ],
        ),
      ),
    );
  }
}
