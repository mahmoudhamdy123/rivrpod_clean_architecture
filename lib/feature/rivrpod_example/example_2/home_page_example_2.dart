import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Counter extends StateNotifier<int> {
  Counter() : super(1);
  void increment() => state = state + 1;
  // int get value => state;
}

final counterProvider = StateNotifierProvider<Counter, int>(
  (ref) => Counter(),
);

class HomePageExample2 extends ConsumerWidget {
  const HomePageExample2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page Example 2")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(builder: (context, ref, child) {
              final count = ref.watch(counterProvider);
              final text = count.toString();
              return Text(
                text,
                style: Theme.of(context).textTheme.headline4,
              );
            }),
            TextButton(
                onPressed: ref.read(counterProvider.notifier).increment,
                child: const Text("Increment counter"))
          ],
        ),
      ),
    );
  }
}
