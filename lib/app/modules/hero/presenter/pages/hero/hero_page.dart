import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:heroes/app/shared/routes/app_routes.dart';

import '../../../domain/entities/hero_entity.dart';
import '../../../domain/errors/errors.dart';
import '../../stores/hero_filter_store.dart';
import '../../stores/hero_list_store.dart';
import 'components/dialog_filter_widget.dart';
import '../../../../../shared/components/app_error_widget.dart';
import 'components/hero_list_widget.dart';
import '../../../../../shared/components/app_loading_widget.dart';
import 'components/search_widget.dart';

class HeroPage extends StatefulWidget {
  const HeroPage({Key? key}) : super(key: key);

  @override
  _HeroPageState createState() => _HeroPageState();
}

class _HeroPageState extends State<HeroPage> {
  final storeFilter = Modular.get<HeroFilterStore>();
  final store = Modular.get<HeroListStore>();

  final tecSearch = TextEditingController();

  @override
  void initState() {
    super.initState();

    tecSearch.text = storeFilter.state.name;
    store.fetchData(storeFilter.state);
  }

  @override
  void dispose() {
    tecSearch.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SearchWidgetDart(
            controller: tecSearch,
            hintText: 'Digite o nome do super-herói',
            textInputAction: TextInputAction.search,
            prefixIcon: const Icon(Icons.search),
            onChanged: (v) {
              storeFilter.update(storeFilter.state.copyWith(name: v));
              store.fetchData(storeFilter.state);
            },
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ScopedBuilder<HeroListStore, QueryError, List<HeroEntity>>(
              onState: (context, value) {
                return HeroListWidgetDart(
                  lstHero: value,
                  onPressed: (hero) {
                    Modular.to.pushNamed(Routes.heroDetails, arguments: hero, forRoot: true);
                  },
                );
              },
              onLoading: (_) => const AppLoadingWidget(),
              onError: (context, error) => AppErrorWidget(error: error?.message),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showDialogFilters,
        child: const Icon(Icons.filter_alt),
      ),
    );
  }

  void _showDialogFilters() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
          content: DialogFilterWidget(
            state: storeFilter.state,
            onChangeFilter: (newFilter) {
              Navigator.of(context).pop();
              storeFilter.update(newFilter);
              store.fetchData(storeFilter.state);
            },
          ),
        );
      },
    );
  }
}
