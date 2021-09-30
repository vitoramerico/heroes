import 'package:flutter/material.dart';
import 'package:heroes/app/modules/hero/domain/entities/hero_entity.dart';

import 'components/appearance_widget.dart';
import 'components/biography_widget.dart';
import 'components/connections_widget.dart';
import 'components/image_widget.dart';
import 'components/powerstats_widget.dart';
import 'components/work_widget.dart';

class HeroDetailsPage extends StatefulWidget {
  final HeroEntity hero;

  const HeroDetailsPage({Key? key, required this.hero}) : super(key: key);

  @override
  _HeroDetailsPageState createState() => _HeroDetailsPageState();
}

class _HeroDetailsPageState extends State<HeroDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.hero.name),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ImageWidget(heroId: widget.hero.id, image: widget.hero.image),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                PowerstatsWidget(powerstats: widget.hero.powerstats),
                BiographyWidget(biography: widget.hero.biography),
                AppearanceWidget(appearance: widget.hero.appearance),
                WorkWidget(work: widget.hero.work),
                ConnectionsWidget(connections: widget.hero.connections),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
