import 'package:flutter/material.dart';
import 'package:heroes/app/modules/hero/domain/entities/hero_connections_entity.dart';

import 'description_widget.dart';

class ConnectionsWidget extends StatelessWidget {
  final HeroConnectionsEntity connections;

  const ConnectionsWidget({Key? key, required this.connections}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'Conexões',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 8),
            DescriptionWidget(
              title: 'Afiliação de grupo:',
              value: connections.groupAffiliation,
            ),
            DescriptionWidget(
              title: 'Parentes:',
              value: connections.relatives,
            ),
          ],
        ),
      ),
    );
  }
}
