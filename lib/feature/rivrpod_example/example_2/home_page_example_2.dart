import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final currentDate = Provider<DateTime>(((ref) => DateTime.now()));

class HomePageExample2 extends ConsumerWidget {
  const HomePageExample2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(currentDate);
    return Scaffold(
      appBar: AppBar(title: Text("Home Page Example 1")),
      body: Center(
          child: Text(
        date.toIso8601String(),
        style: Theme.of(context).textTheme.headline4,
      )),
    );
  }
}
