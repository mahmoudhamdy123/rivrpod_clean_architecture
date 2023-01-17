import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum City {
  cairo,
  alexandria,
  aswan,
}

typedef WeatherEmoji = String;
Future<WeatherEmoji> getWeather(City city) {
  return Future.delayed(
    const Duration(seconds: 1),
    () => {
      City.alexandria: '❄️',
      City.cairo: '🌧️',
      City.aswan: '🌞',
    }[city]!,
  );
}

final currentCityProvider = StateProvider<City?>(
  (ref) => null,
);

final weatherProvider = FutureProvider<WeatherEmoji>((ref) {
  final city = ref.watch(currentCityProvider);
  if (city != null) {
    return getWeather(city);
  } else {
    return "🌤️";
  }
});

class HomePageExample3 extends ConsumerWidget {
  const HomePageExample3({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentWeather = ref.watch(weatherProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Weather")),
      body: Column(children: [
        currentWeather.when(
          data: (data) => Text(data, style: const TextStyle(fontSize: 40)),
          error: (Object error, StackTrace stackTrace) {
            return const Text(
              "Error 😔",
              style: TextStyle(fontSize: 40),
            );
          },
          loading: () {
            return const Text("Loading..", style: TextStyle(fontSize: 40));
          },
        ),
        Expanded(
            child: ListView.builder(
                itemCount: City.values.length,
                itemBuilder: (context, index) {
                  final city = City.values[index];
                  final isSelected = city == ref.watch(currentCityProvider);
                  return ListTile(
                    title: Text(city.toString()),
                    trailing: isSelected ? const Icon(Icons.check) : null,
                    onTap: () {
                      ref.read(currentCityProvider.notifier).state = city;
                    },
                  );
                }))
      ]),
    );
  }
}
