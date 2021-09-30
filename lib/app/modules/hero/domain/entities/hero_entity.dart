import 'hero_appearance_entity.dart';
import 'hero_biography_entity.dart';
import 'hero_connections_entity.dart';
import 'hero_image_entity.dart';
import 'hero_powerstats_entity.dart';
import 'hero_work_entity.dart';

class HeroEntity {
  final String id;
  final String name;
  final HeroPowerstatsEntity powerstats;
  final HeroBiographyEntity biography;
  final HeroAppearanceEntity appearance;
  final HeroWorkEntity work;
  final HeroConnectionsEntity connections;
  final HeroImageEntity image;

  HeroEntity({
    required this.id,
    required this.name,
    required this.powerstats,
    required this.biography,
    required this.appearance,
    required this.work,
    required this.connections,
    required this.image,
  });
}
