import 'package:flutter/material.dart';
import 'package:heroes/app/modules/hero/domain/entities/hero_appearance_entity.dart';

import 'description_widget.dart';

class AppearanceWidget extends StatelessWidget {
  final HeroAppearanceEntity appearance;

  const AppearanceWidget({Key? key, required this.appearance}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'Aparência',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 8),
            DescriptionWidget(
              title: 'Gênero:',
              value: appearance.gender,
            ),
            DescriptionWidget(
              title: 'Raça:',
              value: appearance.race,
            ),
            DescriptionWidget(
              title: 'Altura:',
              value: appearance.heightInCm,
            ),
            DescriptionWidget(
              title: 'Peso:',
              value: appearance.weightInKg,
            ),
            DescriptionWidget(
              title: 'Cor dos olhos:',
              value: appearance.eyeColor,
            ),
            DescriptionWidget(
              title: 'Cor do cabelo:',
              value: appearance.hairColor,
            ),
          ],
        ),
      ),
    );
  }
}
