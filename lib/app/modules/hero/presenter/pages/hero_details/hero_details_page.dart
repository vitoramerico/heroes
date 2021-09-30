import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:heroes/app/modules/hero/domain/entities/hero_entity.dart';
import 'package:heroes/app/modules/hero/presenter/pages/hero/components/loading_widget.dart';

class HeroDetailsPage extends StatefulWidget {
  final HeroEntity hero;

  const HeroDetailsPage({Key? key, required this.hero}) : super(key: key);

  @override
  _HeroDetailsPageState createState() => _HeroDetailsPageState();
}

class _HeroDetailsPageState extends State<HeroDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.hero.name),
        centerTitle: true,
      ),
      body: Hero(
        tag: widget.hero.id.toString(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          child: CachedNetworkImage(
            imageUrl: widget.hero.image.url,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            placeholder: (context, url) => const SizedBox(width: 60, child: LoadingWidget()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
