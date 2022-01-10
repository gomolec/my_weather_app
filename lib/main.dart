import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather_app/bloc/bloc/search_bloc.dart';
import 'package:my_weather_app/repositories/location_repository.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LocationRepository locationRepository = LocationRepository();
    return BlocProvider(
      create: (context) => SearchBloc(locationRepository),
      child: const MaterialApp(
        title: 'Weather App',
        home: SearchPage(),
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  context.read<SearchBloc>().add(const SearchLocate());
                },
                child: const Text("Locate"),
              ),
              BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  if (state.responce.isNotEmpty) {
                    return ListTile(
                      title: Text(state.responce[0].name.toString()),
                      subtitle: Text(state.responce[0].country.toString()),
                      trailing: Column(
                        children: [
                          Text(state.responce[0].lat.toString()),
                          Text(state.responce[0].lon.toString()),
                        ],
                      ),
                    );
                  }
                  return const CircularProgressIndicator();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
