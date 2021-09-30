import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:heroes/app/modules/hero/presenter/stores/home_store.dart';
import 'package:heroes/app/shared/components/app_error_widget.dart';
import 'package:heroes/app/shared/routes/app_routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final store = Modular.get<HomeStore>();

  @override
  void initState() {
    super.initState();

    Modular.to.navigate(Routes.heroAll);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Super-heróis'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: RouterOutlet(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ScopedBuilder<HomeStore, Exception, int>(
        onState: (context, value) {
          return BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Heróis',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.people),
                label: 'Heróis com mesmo poder',
              ),
            ],
            currentIndex: value,
            onTap: (v) {
              switch (v) {
                case 0:
                  Modular.to.navigate(Routes.heroAll);
                  store.update(0);
                  break;
                case 1:
                  Modular.to.navigate(Routes.heroSamePower);
                  store.update(1);
                  break;
              }
            },
          );
        },
        onError: (context, error) => AppErrorWidget(error: error?.toString()),
      ),
    );
  }
}
