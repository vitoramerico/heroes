import 'package:flutter_triple/flutter_triple.dart';
import 'package:heroes/app/modules/hero/domain/entities/hero_filter_entity.dart';

class HeroFilterStore extends NotifierStore<Exception, HeroFilterEntity> {
  HeroFilterEntity get filterDefault => const HeroFilterEntity();

  HeroFilterStore() : super(const HeroFilterEntity(name: ''));
}
