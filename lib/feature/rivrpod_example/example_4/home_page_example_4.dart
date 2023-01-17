import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const names = [
  "Mahmoud",
  "Ahmed",
  "User",
  "Larry",
  "Eve",
  "Fred",
];

final tickerProvider = StreamProvider(
    ((ref) => Stream.periodic(const Duration(seconds: 1), (i) => i + 1)));

final nameProvider = StreamProvider(((ref) =>
    ref.watch(tickerProvider.stream).map((count) => names.getRange(0, count))));

class HomePageExample4 extends ConsumerWidget {
  const HomePageExample4({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final names = ref.watch(nameProvider);
    return Scaffold(
      appBar: AppBar(title: const Text("Stream Provider")),
      body: names.when(
          data: (data) => ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) =>
                  ListTile(title: Text(data.elementAt(index)))),
          error: (object, stackTrace) => const Text("Error...."),
          loading: () => const Center(
                child: CircularProgressIndicator.adaptive(),
              )),
    );
  }
}
