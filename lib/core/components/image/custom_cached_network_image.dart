import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_clean_architecture/core/components/shimmering/custom_shimmering_widget.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage(
      {Key? key, required this.url, required this.height, required this.width})
      : super(key: key);

  final String? url;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url!,
      placeholder: (BuildContext context, _) {
        return CustomShimmeringWidget(
          child: Container(
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            height: height,
            width: width,
          ),
        );
      },
      errorWidget: (BuildContext context, _, dynamic v) {
        return Image.asset(
          'assets/images/placeholder-image.jpg',
          height: height,
          width: width,
          fit: BoxFit.cover,
        );
      },
      height: height,
      width: width,
      fit: BoxFit.cover,
    );
  }
}
