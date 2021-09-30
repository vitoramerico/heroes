import 'package:heroes/app/modules/hero/domain/entities/hero_filter_entity.dart';

class HeroFilterModel {
  final String name;
  final int intelligenceMin;
  final int intelligenceMax;
  final int strengthMin;
  final int strengthMax;
  final int speedMin;
  final int speedMax;
  final int durabilityMin;
  final int durabilityMax;
  final int powerMin;
  final int powerMax;
  final int combatMin;
  final int combatMax;

  HeroFilterModel({
    required this.name,
    required this.intelligenceMin,
    required this.intelligenceMax,
    required this.strengthMin,
    required this.strengthMax,
    required this.speedMin,
    required this.speedMax,
    required this.durabilityMin,
    required this.durabilityMax,
    required this.powerMin,
    required this.powerMax,
    required this.combatMin,
    required this.combatMax,
  });

  factory HeroFilterModel.fromEntity(HeroFilterEntity value) {
    return HeroFilterModel(
      name: value.name,
      intelligenceMin: value.intelligenceMin,
      intelligenceMax: value.intelligenceMax,
      strengthMin: value.strengthMin,
      strengthMax: value.strengthMax,
      speedMin: value.speedMin,
      speedMax: value.speedMax,
      durabilityMin: value.durabilityMin,
      durabilityMax: value.durabilityMax,
      powerMin: value.powerMin,
      powerMax: value.powerMax,
      combatMin: value.combatMin,
      combatMax: value.combatMax,
    );
  }

  HeroFilterEntity toEntity() {
    return HeroFilterEntity(
      name: name,
      intelligenceMin: intelligenceMin,
      intelligenceMax: intelligenceMax,
      strengthMin: strengthMin,
      strengthMax: strengthMax,
      speedMin: speedMin,
      speedMax: speedMax,
      durabilityMin: durabilityMin,
      durabilityMax: durabilityMax,
      powerMin: powerMin,
      powerMax: powerMax,
      combatMin: combatMin,
      combatMax: combatMax,
    );
  }
}
