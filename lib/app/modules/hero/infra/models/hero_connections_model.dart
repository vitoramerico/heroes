import 'dart:convert';

import 'package:heroes/app/modules/hero/domain/entities/hero_connections_entity.dart';

class HeroConnectionsModel {
  final String groupAffiliation;
  final String relatives;

  HeroConnectionsModel({
    required this.groupAffiliation,
    required this.relatives,
  });

  factory HeroConnectionsModel.fromEntity(HeroConnectionsEntity value) {
    return HeroConnectionsModel(
      groupAffiliation: value.groupAffiliation,
      relatives: value.relatives,
    );
  }

  HeroConnectionsEntity toEntity() {
    return HeroConnectionsEntity(
      groupAffiliation: groupAffiliation,
      relatives: relatives,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'group-affiliation': groupAffiliation,
      'relatives': relatives,
    };
  }

  factory HeroConnectionsModel.fromMap(Map<String, dynamic> map) {
    return HeroConnectionsModel(
      groupAffiliation: map['group-affiliation'],
      relatives: map['relatives'],
    );
  }

  String toJson() => json.encode(toMap());

  factory HeroConnectionsModel.fromJson(String source) => HeroConnectionsModel.fromMap(json.decode(source));
}
