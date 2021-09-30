import 'dart:convert';

import 'package:heroes/app/modules/hero/domain/entities/hero_work_entity.dart';

class HeroWorkModel {
  final String occupation;
  final String base;

  HeroWorkModel({
    required this.occupation,
    required this.base,
  });

  factory HeroWorkModel.fromEntity(HeroWorkEntity value) {
    return HeroWorkModel(
      occupation: value.occupation,
      base: value.base,
    );
  }

  HeroWorkEntity toEntity() {
    return HeroWorkEntity(
      occupation: occupation,
      base: base,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'occupation': occupation,
      'base': base,
    };
  }

  factory HeroWorkModel.fromMap(Map<String, dynamic> map) {
    return HeroWorkModel(
      occupation: map['occupation'],
      base: map['base'],
    );
  }

  String toJson() => json.encode(toMap());

  factory HeroWorkModel.fromJson(String source) => HeroWorkModel.fromMap(json.decode(source));
}
