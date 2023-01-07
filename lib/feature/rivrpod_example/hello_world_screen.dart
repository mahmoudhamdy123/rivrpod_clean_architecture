import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hello = Provider<String>((ref) {
  return "Hello World";
});

class HelloWorldScreen extends ConsumerWidget {
  const HelloWorldScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Text(
          ref.watch(hello),
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
