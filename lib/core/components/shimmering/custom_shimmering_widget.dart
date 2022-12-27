import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class CustomShimmeringWidget extends StatelessWidget {
  final Widget child;

  const CustomShimmeringWidget({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      colorOpacity: 0.1,
      color: Theme.of(context).primaryColor.withOpacity(0.1),
      duration: const Duration(milliseconds: 1500),
      child: child,
    );
  }
}
