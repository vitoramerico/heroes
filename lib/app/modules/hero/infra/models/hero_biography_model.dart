import 'dart:convert';

import 'package:heroes/app/modules/hero/domain/entities/hero_biography_entity.dart';

class HeroBiographyModel {
  final String fullName;
  final String alterEgos;
  final List<String> aliases;
  final String placeOfBirth;
  final String firstAppearance;
  final String publisher;
  final String alignment;

  HeroBiographyModel({
    required this.fullName,
    required this.alterEgos,
    required this.aliases,
    required this.placeOfBirth,
    required this.firstAppearance,
    required this.publisher,
    required this.alignment,
  });

  factory HeroBiographyModel.fromEntity(HeroBiographyEntity value) {
    return HeroBiographyModel(
      fullName: value.fullName,
      alterEgos: value.alterEgos,
      aliases: value.aliases,
      placeOfBirth: value.placeOfBirth,
      firstAppearance: value.firstAppearance,
      publisher: value.publisher,
      alignment: value.alignment,
    );
  }

  HeroBiographyEntity toEntity() {
    return HeroBiographyEntity(
      fullName: fullName,
      alterEgos: alterEgos,
      aliases: aliases,
      placeOfBirth: placeOfBirth,
      firstAppearance: firstAppearance,
      publisher: publisher,
      alignment: alignment,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'full-name': fullName,
      'alter-egos': alterEgos,
      'aliases': aliases,
      'place-of-birth': placeOfBirth,
      'first-appearance': firstAppearance,
      'publisher': publisher,
      'alignment': alignment,
    };
  }

  factory HeroBiographyModel.fromMap(Map<String, dynamic> map) {
    return HeroBiographyModel(
      fullName: map['full-name'],
      alterEgos: map['alter-egos'],
      aliases: List<String>.from(map['aliases']),
      placeOfBirth: map['place-of-birth'],
      firstAppearance: map['first-appearance'],
      publisher: map['publisher'],
      alignment: map['alignment'],
    );
  }

  String toJson() => json.encode(toMap());

  factory HeroBiographyModel.fromJson(String source) => HeroBiographyModel.fromMap(json.decode(source));
}
