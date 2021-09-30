import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:heroes/app/modules/hero/domain/entities/hero_image_entity.dart';
import 'package:heroes/app/shared/components/app_loading_widget.dart';

class ImageWidget extends StatelessWidget {
  final String heroId;
  final HeroImageEntity image;

  const ImageWidget({Key? key, required this.heroId, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: heroId,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        child: CachedNetworkImage(
          imageUrl: image.url,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          placeholder: (context, url) => const AppLoadingWidget(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
