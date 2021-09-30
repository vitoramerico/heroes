import 'package:equatable/equatable.dart';

import 'hero_appearance_entity.dart';
import 'hero_biography_entity.dart';
import 'hero_connections_entity.dart';
import 'hero_image_entity.dart';
import 'hero_powerstats_entity.dart';
import 'hero_work_entity.dart';

class HeroEntity extends Equatable {
  final String id;
  final String name;
  final HeroPowerstatsEntity powerstats;
  final HeroBiographyEntity biography;
  final HeroAppearanceEntity appearance;
  final HeroWorkEntity work;
  final HeroConnectionsEntity connections;
  final HeroImageEntity image;

  const HeroEntity({
    required this.id,
    required this.name,
    required this.powerstats,
    required this.biography,
    required this.appearance,
    required this.work,
    required this.connections,
    required this.image,
  });

  HeroEntity copyWith({
    String? id,
    String? name,
    HeroPowerstatsEntity? powerstats,
    HeroBiographyEntity? biography,
    HeroAppearanceEntity? appearance,
    HeroWorkEntity? work,
    HeroConnectionsEntity? connections,
    HeroImageEntity? image,
  }) {
    return HeroEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      powerstats: powerstats ?? this.powerstats,
      biography: biography ?? this.biography,
      appearance: appearance ?? this.appearance,
      work: work ?? this.work,
      connections: connections ?? this.connections,
      image: image ?? this.image,
    );
  }

  @override
  List<Object> get props => [
        powerstats.intelligence,
        powerstats.strength,
        powerstats.speed,
        powerstats.durability,
        powerstats.power,
        powerstats.combat,
      ];
}
