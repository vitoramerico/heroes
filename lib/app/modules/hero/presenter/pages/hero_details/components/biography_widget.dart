import 'package:flutter/material.dart';
import 'package:heroes/app/modules/hero/domain/entities/hero_biography_entity.dart';

import 'description_widget.dart';

class BiographyWidget extends StatelessWidget {
  final HeroBiographyEntity biography;

  const BiographyWidget({Key? key, required this.biography}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'Biografia',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 8),
            DescriptionWidget(
              title: 'Nome completo:',
              value: biography.fullName,
            ),
            DescriptionWidget(
              title: 'Personalidade secundária:',
              value: biography.alterEgos,
            ),
            DescriptionWidget(
              title: 'Apelidos:',
              value: biography.concatenateAliases,
            ),
            DescriptionWidget(
              title: 'Local de nascimento:',
              value: biography.placeOfBirth,
            ),
            DescriptionWidget(
              title: 'Primeira aparência:',
              value: biography.firstAppearance,
            ),
            DescriptionWidget(
              title: 'Editor:',
              value: biography.publisher,
            ),
            DescriptionWidget(
              title: 'Alinhamento:',
              value: biography.alignment,
            ),
          ],
        ),
      ),
    );
  }
}
