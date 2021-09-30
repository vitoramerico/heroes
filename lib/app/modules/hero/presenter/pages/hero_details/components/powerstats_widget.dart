import 'package:flutter/material.dart';
import 'package:heroes/app/modules/hero/domain/entities/hero_powerstats_entity.dart';

import 'description_widget.dart';

class PowerstatsWidget extends StatelessWidget {
  final HeroPowerstatsEntity powerstats;

  const PowerstatsWidget({Key? key, required this.powerstats}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'Poderes',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 8),
            DescriptionWidget(
              title: 'Inteligencia:',
              value: powerstats.intelligence.toString(),
            ),
            DescriptionWidget(
              title: 'Força:',
              value: powerstats.strength.toString(),
            ),
            DescriptionWidget(
              title: 'Rapidez:',
              value: powerstats.speed.toString(),
            ),
            DescriptionWidget(
              title: 'Durabilidade:',
              value: powerstats.durability.toString(),
            ),
            DescriptionWidget(
              title: 'Poder:',
              value: powerstats.power.toString(),
            ),
            DescriptionWidget(
              title: 'Combate:',
              value: powerstats.combat.toString(),
            ),
          ],
        ),
      ),
    );
  }
}
