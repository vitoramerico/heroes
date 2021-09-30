import 'package:flutter/material.dart';
import 'package:heroes/app/modules/hero/domain/entities/hero_filter_entity.dart';

class DialogFilterWidget extends StatefulWidget {
  final HeroFilterEntity state;
  final Function(HeroFilterEntity newfilter) onChangeFilter;

  const DialogFilterWidget({
    Key? key,
    required this.state,
    required this.onChangeFilter,
  }) : super(key: key);

  @override
  _DialogFilterWidgetState createState() => _DialogFilterWidgetState();
}

class _DialogFilterWidgetState extends State<DialogFilterWidget> {
  final filterDefault = const HeroFilterEntity();

  late HeroFilterEntity filter;

  final double min = 0;
  final double max = 100;
  final int divisions = 20;

  void update(HeroFilterEntity filter) {
    setState(() {
      this.filter = filter;
    });
  }

  @override
  void initState() {
    super.initState();
    update(widget.state.copyWith());
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildTextFilters(),
            _buildIntelligence(),
            _buildStrength(),
            _buildSpeed(),
            _buildDurability(),
            _buildPower(),
            _buildCombat(),
            _buildButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFilters() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Filtro por poderes',
          style: Theme.of(context).textTheme.headline6,
        ),
      );

  Widget _buildIntelligence() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Inteligencia',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          RangeSlider(
            onChanged: (RangeValues value) {
              update(filter.copyWith(
                intelligenceMin: value.start.toInt(),
                intelligenceMax: value.end.toInt(),
              ));
            },
            values: RangeValues(filter.intelligenceMin.toDouble(), filter.intelligenceMax.toDouble()),
            min: min,
            max: max,
            divisions: divisions,
            labels: RangeLabels(
              '${filter.intelligenceMin}',
              '${filter.intelligenceMax}',
            ),
          ),
        ],
      );

  Widget _buildStrength() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Força',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          RangeSlider(
            onChanged: (RangeValues value) {
              update(filter.copyWith(
                strengthMin: value.start.toInt(),
                strengthMax: value.end.toInt(),
              ));
            },
            values: RangeValues(filter.strengthMin.toDouble(), filter.strengthMax.toDouble()),
            min: min,
            max: max,
            divisions: divisions,
            labels: RangeLabels(
              '${filter.strengthMin}',
              '${filter.strengthMax}',
            ),
          ),
        ],
      );

  Widget _buildSpeed() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Velocidade',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          RangeSlider(
            onChanged: (RangeValues value) {
              update(filter.copyWith(
                speedMin: value.start.toInt(),
                speedMax: value.end.toInt(),
              ));
            },
            values: RangeValues(filter.speedMin.toDouble(), filter.speedMax.toDouble()),
            min: min,
            max: max,
            divisions: divisions,
            labels: RangeLabels(
              '${filter.speedMin}',
              '${filter.speedMax}',
            ),
          ),
        ],
      );

  Widget _buildDurability() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Durabilidade',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          RangeSlider(
            onChanged: (RangeValues value) {
              update(filter.copyWith(
                durabilityMin: value.start.toInt(),
                durabilityMax: value.end.toInt(),
              ));
            },
            values: RangeValues(filter.durabilityMin.toDouble(), filter.durabilityMax.toDouble()),
            min: min,
            max: max,
            divisions: divisions,
            labels: RangeLabels(
              '${filter.durabilityMin}',
              '${filter.durabilityMax}',
            ),
          ),
        ],
      );

  Widget _buildPower() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Poder',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          RangeSlider(
            onChanged: (RangeValues value) {
              update(filter.copyWith(
                powerMin: value.start.toInt(),
                powerMax: value.end.toInt(),
              ));
            },
            values: RangeValues(filter.powerMin.toDouble(), filter.powerMax.toDouble()),
            min: min,
            max: max,
            divisions: divisions,
            labels: RangeLabels(
              '${filter.powerMin}',
              '${filter.powerMax}',
            ),
          ),
        ],
      );

  Widget _buildCombat() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Combate',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          RangeSlider(
            onChanged: (RangeValues value) {
              update(filter.copyWith(
                combatMin: value.start.toInt(),
                combatMax: value.end.toInt(),
              ));
            },
            values: RangeValues(filter.combatMin.toDouble(), filter.combatMax.toDouble()),
            min: min,
            max: max,
            divisions: divisions,
            labels: RangeLabels(
              '${filter.combatMin}',
              '${filter.combatMax}',
            ),
          ),
        ],
      );

  Widget _buildButtons() => Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OutlinedButton(
              onPressed: () {
                var filterRestore = filterDefault.copyWith(name: filter.name);
                update(filterRestore);
              },
              child: const Text('RESTAURAR'),
            ),
            ElevatedButton(
              onPressed: () => widget.onChangeFilter(filter),
              child: const Text('FILTRAR'),
            ),
          ],
        ),
      );
}
