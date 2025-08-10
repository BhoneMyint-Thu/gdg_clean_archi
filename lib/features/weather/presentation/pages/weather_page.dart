import 'package:clean_archi/features/weather/presentation/notifier/weather/weather_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeatherPage extends ConsumerStatefulWidget {
  const WeatherPage({super.key});

  @override
  ConsumerState<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends ConsumerState<WeatherPage> {
  final _latCnt = TextEditingController();
  final _lonCnt = TextEditingController();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(dummyNotifierProvider.notifier).getDummy();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Current Weather")),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Consumer(
              builder: (context, ref, child) {
                final dummy = ref.watch(dummyNotifierProvider);
                switch (dummy) {
                  case DummyLoading():
                    return Center(child: CircularProgressIndicator());
                  case DummyError(:final error):
                    return Text(error.message ?? "");
                  case DummyLoaded(:final dummy):
                    return Row(
                      children: [
                        Expanded(child: Text(dummy.name ?? "")),
                        Expanded(child: Text(dummy.event ?? "")),
                      ],
                    );
                  default:
                    return const SizedBox();
                }
              },
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _latCnt,
                    decoration: InputDecoration(hint: Text("Lat")),
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: _lonCnt,
                    decoration: InputDecoration(hint: Text("Lon")),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    ref
                        .read(weatherNotifierProvider.notifier)
                        .getWeather(lat: _latCnt.text, lon: _lonCnt.text);
                  },
                  child: Text("Search"),
                ),
              ],
            ),
            Consumer(
              builder: (context, ref, _) {
                final weatherState = ref.watch(weatherNotifierProvider);
                switch (weatherState) {
                  case WeatherLoading():
                    return Center(child: CircularProgressIndicator());
                  case WeatherError(:final error):
                    return Text(error.message ?? "");
                  case WeatherLoaded(:final weather):
                    return Expanded(
                      child: ListView.separated(
                        itemCount: weather.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 20),
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              children: [
                                Text(
                                  "Main: ${weather[index]?.main}",
                                  style: TextStyle(color: Colors.black),
                                ),
                                Text(
                                  "Desc: ${weather[index]?.description}",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  default:
                    return const SizedBox();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
