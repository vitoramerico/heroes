import 'package:flutter/material.dart';
import 'package:heroes/app/modules/hero/domain/entities/hero_entity.dart';

import 'hero_card_widget.dart';

class HeroListWidgetDart extends StatelessWidget {
  final List<HeroEntity> lstHero;
  final Function(HeroEntity hero) onPressed;

  const HeroListWidgetDart({
    Key? key,
    required this.lstHero,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, index) {
        return HeroCardWidget(
          hero: lstHero[index],
          onPressed: onPressed,
        );
      },
      itemCount: lstHero.length,
    );
  }
}
