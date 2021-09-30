import 'dart:convert';

import 'package:heroes/app/modules/hero/domain/entities/hero_entity.dart';

import 'hero_appearance_model.dart';
import 'hero_biography_model.dart';
import 'hero_connections_model.dart';
import 'hero_image_model.dart';
import 'hero_powerstats_model.dart';
import 'hero_work_model.dart';

class HeroModel {
  final String id;
  final String name;
  final HeroPowerstatsModel powerstats;
  final HeroBiographyModel biography;
  final HeroAppearanceModel appearance;
  final HeroWorkModel work;
  final HeroConnectionsModel connections;
  final HeroImageModel image;

  HeroModel({
    required this.id,
    required this.name,
    required this.powerstats,
    required this.biography,
    required this.appearance,
    required this.work,
    required this.connections,
    required this.image,
  });

  factory HeroModel.fromEntity(HeroEntity value) {
    return HeroModel(
      id: value.id,
      name: value.name,
      powerstats: HeroPowerstatsModel.fromEntity(value.powerstats),
      biography: HeroBiographyModel.fromEntity(value.biography),
      appearance: HeroAppearanceModel.fromEntity(value.appearance),
      work: HeroWorkModel.fromEntity(value.work),
      connections: HeroConnectionsModel.fromEntity(value.connections),
      image: HeroImageModel.fromEntity(value.image),
    );
  }

  HeroEntity toEntity() {
    return HeroEntity(
      id: id,
      name: name,
      powerstats: powerstats.toEntity(),
      biography: biography.toEntity(),
      appearance: appearance.toEntity(),
      work: work.toEntity(),
      connections: connections.toEntity(),
      image: image.toEntity(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'powerstats': powerstats.toMap(),
      'biography': biography.toMap(),
      'appearance': appearance.toMap(),
      'work': work.toMap(),
      'connections': connections.toMap(),
      'image': image.toMap(),
    };
  }

  factory HeroModel.fromMap(Map<String, dynamic> map) {
    return HeroModel(
      id: map['id'],
      name: map['name'],
      powerstats: HeroPowerstatsModel.fromMap(map['powerstats']),
      biography: HeroBiographyModel.fromMap(map['biography']),
      appearance: HeroAppearanceModel.fromMap(map['appearance']),
      work: HeroWorkModel.fromMap(map['work']),
      connections: HeroConnectionsModel.fromMap(map['connections']),
      image: HeroImageModel.fromMap(map['image']),
    );
  }

  String toJson() => json.encode(toMap());

  factory HeroModel.fromJson(String source) => HeroModel.fromMap(json.decode(source));
}
