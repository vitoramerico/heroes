import 'dart:convert';

import 'package:heroes/app/modules/hero/domain/entities/hero_appearance_entity.dart';

class HeroAppearanceModel {
  final String gender;
  final String race;
  final List<String> height;
  final List<String> weight;
  final String eyeColor;
  final String hairColor;

  HeroAppearanceModel({
    required this.gender,
    required this.race,
    required this.height,
    required this.weight,
    required this.eyeColor,
    required this.hairColor,
  });

  factory HeroAppearanceModel.fromEntity(HeroAppearanceEntity value) {
    return HeroAppearanceModel(
      gender: value.gender,
      race: value.race,
      height: value.height,
      weight: value.weight,
      eyeColor: value.eyeColor,
      hairColor: value.hairColor,
    );
  }

  HeroAppearanceEntity toEntity() {
    return HeroAppearanceEntity(
      gender: gender,
      race: race,
      height: height,
      weight: weight,
      eyeColor: eyeColor,
      hairColor: hairColor,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'gender': gender,
      'race': race,
      'height': height,
      'weight': weight,
      'eye-color': eyeColor,
      'hair-color': hairColor,
    };
  }

  factory HeroAppearanceModel.fromMap(Map<String, dynamic> map) {
    return HeroAppearanceModel(
      gender: map['gender'],
      race: map['race'],
      height: List<String>.from(map['height']),
      weight: List<String>.from(map['weight']),
      eyeColor: map['eye-color'],
      hairColor: map['hair-color'],
    );
  }

  String toJson() => json.encode(toMap());

  factory HeroAppearanceModel.fromJson(String source) => HeroAppearanceModel.fromMap(json.decode(source));
}
