import 'dart:convert';

import 'package:heroes/app/modules/hero/domain/entities/hero_image_entity.dart';

class HeroImageModel {
  final String url;

  HeroImageModel({
    required this.url,
  });

  factory HeroImageModel.fromEntity(HeroImageEntity value) {
    return HeroImageModel(
      url: value.url,
    );
  }

  HeroImageEntity toEntity() {
    return HeroImageEntity(
      url: url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'url': url,
    };
  }

  factory HeroImageModel.fromMap(Map<String, dynamic> map) {
    return HeroImageModel(
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory HeroImageModel.fromJson(String source) => HeroImageModel.fromMap(json.decode(source));
}
