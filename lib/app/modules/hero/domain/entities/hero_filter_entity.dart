class HeroFilterEntity {
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

  const HeroFilterEntity({
    this.name = '',
    this.intelligenceMin = 0,
    this.intelligenceMax = 100,
    this.strengthMin = 0,
    this.strengthMax = 100,
    this.speedMin = 0,
    this.speedMax = 100,
    this.durabilityMin = 0,
    this.durabilityMax = 100,
    this.powerMin = 0,
    this.powerMax = 100,
    this.combatMin = 0,
    this.combatMax = 100,
  });

  bool get isValid => name.isNotEmpty;

  HeroFilterEntity copyWith({
    String? name,
    int? intelligenceMin,
    int? intelligenceMax,
    int? strengthMin,
    int? strengthMax,
    int? speedMin,
    int? speedMax,
    int? durabilityMin,
    int? durabilityMax,
    int? powerMin,
    int? powerMax,
    int? combatMin,
    int? combatMax,
  }) {
    return HeroFilterEntity(
      name: name ?? this.name,
      intelligenceMin: intelligenceMin ?? this.intelligenceMin,
      intelligenceMax: intelligenceMax ?? this.intelligenceMax,
      strengthMin: strengthMin ?? this.strengthMin,
      strengthMax: strengthMax ?? this.strengthMax,
      speedMin: speedMin ?? this.speedMin,
      speedMax: speedMax ?? this.speedMax,
      durabilityMin: durabilityMin ?? this.durabilityMin,
      durabilityMax: durabilityMax ?? this.durabilityMax,
      powerMin: powerMin ?? this.powerMin,
      powerMax: powerMax ?? this.powerMax,
      combatMin: combatMin ?? this.combatMin,
      combatMax: combatMax ?? this.combatMax,
    );
  }
}
