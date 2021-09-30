import 'dart:convert';

import 'package:heroes/app/modules/hero/domain/entities/hero_powerstats_entity.dart';

class HeroPowerstatsModel {
  final String intelligence;
  final String strength;
  final String speed;
  final String durability;
  final String power;
  final String combat;

  HeroPowerstatsModel({
    required this.intelligence,
    required this.strength,
    required this.speed,
    required this.durability,
    required this.power,
    required this.combat,
  });

  factory HeroPowerstatsModel.fromEntity(HeroPowerstatsEntity value) {
    return HeroPowerstatsModel(
      intelligence: value.intelligence.toString(),
      strength: value.strength.toString(),
      speed: value.speed.toString(),
      durability: value.durability.toString(),
      power: value.power.toString(),
      combat: value.combat.toString(),
    );
  }

  HeroPowerstatsEntity toEntity() {
    return HeroPowerstatsEntity(
      intelligence: intelligence != 'null' ? int.parse(intelligence) : 0,
      strength: strength != 'null' ? int.parse(strength) : 0,
      speed: speed != 'null' ? int.parse(speed) : 0,
      durability: durability != 'null' ? int.parse(durability) : 0,
      power: power != 'null' ? int.parse(power) : 0,
      combat: combat != 'null' ? int.parse(combat) : 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'intelligence': intelligence,
      'strength': strength,
      'speed': speed,
      'durability': durability,
      'power': power,
      'combat': combat,
    };
  }

  factory HeroPowerstatsModel.fromMap(Map<String, dynamic> map) {
    return HeroPowerstatsModel(
      intelligence: map['intelligence'],
      strength: map['strength'],
      speed: map['speed'],
      durability: map['durability'],
      power: map['power'],
      combat: map['combat'],
    );
  }

  String toJson() => json.encode(toMap());

  factory HeroPowerstatsModel.fromJson(String source) => HeroPowerstatsModel.fromMap(json.decode(source));
}
