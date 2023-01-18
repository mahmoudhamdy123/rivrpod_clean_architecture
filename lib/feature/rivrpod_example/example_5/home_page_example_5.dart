import 'dart:collection';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

@immutable
class Person {
  final String name;
  final int age;
  final String uuid;

  Person({required this.name, required this.age, String? uuid})
      : uuid = uuid ?? const Uuid().v4();

  Person update([String? name, int? age]) =>
      Person(name: name ?? this.name, age: age ?? this.age);

  String get displayName => '$name ($age years old)';

  @override
  bool operator ==(covariant Person other) => uuid == other.uuid;

  @override
  int get hashCode => uuid.hashCode;

  @override
  String toString() => "Person(name: $name,age : $age , uuid:$uuid)";
}

class DataModel extends ChangeNotifier {
  final List<Person> _people = [];
  int get count => _people.length;

  UnmodifiableListView<Person> get people => UnmodifiableListView(_people);

  void addPerson(Person person) {
    _people.add(person);
    notifyListeners();
  }

  void removePerson(Person person) {
    _people.remove(person);
    notifyListeners();
  }
}

final peopleProvider = ChangeNotifierProvider(((_) => DataModel()));

class HomePageExample5 extends ConsumerWidget {
  const HomePageExample5({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page")),
      body: Consumer(builder: (context, ref, child) {
        final dataModel = ref.watch(peopleProvider);
        return ListView.builder(
          itemCount: dataModel.count,
          itemBuilder: (context, index) {
            final person = dataModel.people[index];
            return ListTile(
              title: Text(person.displayName),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Person? person = await createPersonDialog(context);
          if (person != null) {
            DataModel dataModel = ref.read(peopleProvider);
            dataModel.addPerson(person);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

final nameController = TextEditingController();
final ageController = TextEditingController();

Future<Person?> createPersonDialog(BuildContext context) {
  return showDialog<Person>(
      context: context,
      builder: (context) => AlertDialog(
            title: Text("Create person"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: nameController,
                  decoration:
                      const InputDecoration(labelText: "Enter name here.."),
                ),
                TextFormField(
                  controller: ageController,
                  decoration:
                      const InputDecoration(labelText: "Enter age here.."),
                )
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Cancel")),
              TextButton(
                  onPressed: () {
                    if (nameController.text.trim().isNotEmpty &&
                        ageController.text.trim().isNotEmpty) {
                      Navigator.of(context).pop(Person(
                          name: nameController.text.trim(),
                          age: int.tryParse(ageController.text.trim())!));
                    }
                  },
                  child: const Text("Save"))
            ],
          ));
}
