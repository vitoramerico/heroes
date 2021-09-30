class HeroAppearanceEntity {
  final String gender;
  final String race;
  final List<String> height;
  final List<String> weight;
  final String eyeColor;
  final String hairColor;

  String get heightInCm => height.last;
  String get weightInKg => weight.last;

  HeroAppearanceEntity({
    required this.gender,
    required this.race,
    required this.height,
    required this.weight,
    required this.eyeColor,
    required this.hairColor,
  });
}
