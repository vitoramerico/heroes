import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:heroes/app/modules/hero/domain/entities/hero_entity.dart';

import 'loading_widget.dart';

class HeroCardWidget extends StatelessWidget {
  final HeroEntity hero;
  final Function(HeroEntity hero) onPressed;

  const HeroCardWidget({
    Key? key,
    required this.hero,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        onTap: () => onPressed(hero),
        leading: Hero(
          tag: hero.id.toString(),
          child: CachedNetworkImage(
            imageUrl: hero.image.url,
            imageBuilder: (context, imageProvider) => Container(
              width: 60,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(4)),
              ),
            ),
            placeholder: (context, url) => const SizedBox(width: 60, child: LoadingWidget()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        title: Text(hero.name),
        subtitle: Text(hero.biography.placeOfBirth),
      ),
    );
  }
}
