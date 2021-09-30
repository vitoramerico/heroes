import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:heroes/app/modules/hero/presenter/stores/hero_list_same_power_store.dart';
import 'package:heroes/app/modules/hero/presenter/stores/hero_list_store.dart';
import 'package:heroes/app/shared/routes/app_routes.dart';

import '../../../../../shared/components/app_error_widget.dart';
import '../../../../../shared/components/app_loading_widget.dart';
import '../../../domain/entities/hero_entity.dart';
import '../../../domain/errors/errors.dart';
import 'components/hero_list_widget.dart';

class HeroSamePowerPage extends StatefulWidget {
  const HeroSamePowerPage({Key? key}) : super(key: key);

  @override
  _HeroSamePowerPageState createState() => _HeroSamePowerPageState();
}

class _HeroSamePowerPageState extends State<HeroSamePowerPage> {
  final storeList = Modular.get<HeroListStore>();
  final store = Modular.get<HeroListSamePowerStore>();

  @override
  void initState() {
    super.initState();

    store.fetchData(storeList.state);
  }

  @override
  Widget build(BuildContext context) {
    return ScopedBuilder<HeroListSamePowerStore, QueryError, Map<int, List<HeroEntity>>>(
      onState: (context, value) {
        return HeroListWidgetDart(
          mapHeros: value,
          onPressed: (hero) {
            Modular.to.pushNamed(Routes.heroDetails, arguments: hero, forRoot: true);
          },
        );
      },
      onLoading: (_) => const AppLoadingWidget(),
      onError: (context, error) => AppErrorWidget(error: error?.message),
    );
  }
}
