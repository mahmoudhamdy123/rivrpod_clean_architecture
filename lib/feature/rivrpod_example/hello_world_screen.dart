import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Creating a provider
final myProvider = Provider((ref) {
  return MyValue();
});

//.autoDispose, which will make the provider automatically destroy its state when it is no longer being listened to.
final myAutoDisposeProvider = StateProvider.autoDispose<int>((ref) => 0);
//.family, which allows creating a provider from external parameters.
final myFamilyProvider = Provider.family<String, int>((ref, id) => '$id');
//A provider can use multiple modifiers at once:
final userProvider =
    FutureProvider.autoDispose.family<User, int>((ref, userId) async {
  return fetchUser(userId);
});

final hello = Provider<String>((ref) {
  return "Hello World";
});

//Reading a Provider
final repositoryProvider = Provider((ref) {
  return MyValue();
});
final provider = Provider((ref) {
  // use ref to obtain other providers
  final repository = ref.watch(repositoryProvider);

  return SomeValue(repository);
});
//Doing so allows our Counter class to read providers.
final counterProvider = StateNotifierProvider<Counter, int>((ref) {
  return Counter(ref);
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

Future<User> fetchUser(int id) async {
  return User();
}

class SomeValue {
  final MyValue myValue;

  SomeValue(this.myValue);
}

class User {}

class MyValue {}

class Counter extends StateNotifier<int> {
  Counter(this.ref) : super(0);

  final Ref ref;

  void increment() {
    // Counter can use the "ref" to read other providers
    final repository = ref.read(repositoryProvider);
    // repository.post('...');
  }
}
