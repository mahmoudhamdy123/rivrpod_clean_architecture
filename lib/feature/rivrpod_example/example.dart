import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final name = Provider<String>((ref) => "Mahmoud");

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Hello ${name}")),
    );
  }
}
