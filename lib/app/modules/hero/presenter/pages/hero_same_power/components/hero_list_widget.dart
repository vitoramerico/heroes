import 'package:flutter/material.dart';
import 'package:heroes/app/modules/hero/domain/entities/hero_entity.dart';

import 'hero_card_widget.dart';

class HeroListWidgetDart extends StatelessWidget {
  final Map<int, List<HeroEntity>> mapHeros;
  final Function(HeroEntity hero) onPressed;

  const HeroListWidgetDart({
    Key? key,
    required this.mapHeros,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: mapHeros.entries.map((map) {
        return Card(
          elevation: 2,
          child: ExpansionTile(
            title: Text(_concatenateNames(map.value)),
            children: map.value.map((hero) {
              return HeroCardWidget(
                hero: hero,
                onPressed: onPressed,
              );
            }).toList(),
          ),
        );
      }).toList(),
    );
  }

  String _concatenateNames(List<HeroEntity> lstHero) {
    return lstHero.map((v) => v.name).toList().join(', ');
  }
}
