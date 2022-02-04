import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:my_weather_app/bloc/search_bloc/search_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather_app/models/location.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB9A8A1),
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            const SearchBar(),
            const SizedBox(
              height: 8,
            ),
            BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state.responce.isNotEmpty) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.responce.length,
                    itemBuilder: (context, index) {
                      return LocationTile(
                        location: state.responce[index],
                        isFavorite: false,
                      );
                    },
                  );
                }
                return const FavoriteLocations();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class FavoriteLocations extends StatelessWidget {
  const FavoriteLocations({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
          child: Container(
            height: 36,
            alignment: Alignment.bottomLeft,
            child: const Text(
              'Favorite:',
              style: TextStyle(
                fontSize: 24,
                color: Color(0xFF3C3A3A),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const LocationTile(
          location: Location(
            name: "Warszawa",
            lat: 15,
            lon: 15,
            country: "Polska",
          ),
          isFavorite: true,
        ),
        const LocationTile(
          location: Location(
            name: "Kraków",
            lat: 15,
            lon: 15,
            country: "Polska",
          ),
          isFavorite: true,
        ),
        const LocationTile(
          location: Location(
            name: "Katowice",
            lat: 15,
            lon: 15,
            country: "Polska",
          ),
          isFavorite: true,
        ),
      ],
    );
  }
}

class LocationTile extends StatelessWidget {
  final Location location;
  final bool isFavorite;

  const LocationTile({
    Key? key,
    required this.location,
    required this.isFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context
            .read<SearchBloc>()
            .add(SearchLocationSubmitted(location: location));
      },
      child: Container(
        height: 64,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          location.name.toString(),
                          style: const TextStyle(
                            fontSize: 24,
                            color: Color(0xFF3C3A3A),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          location.country.toString(),
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xAA3C3A3A),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      isFavorite
                          ? LineAwesomeIcons.heart_1
                          : LineAwesomeIcons.heart,
                      size: 32,
                      color: const Color(0xFF3C3A3A),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              height: 1,
              color: Color(0xFF3C3A3A),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const TextStyle textstyle = TextStyle(
      fontSize: 24,
      color: Color(0xFF3C3A3A),
      fontWeight: FontWeight.w600,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: TextField(
                  onChanged: (value) {
                    context
                        .read<SearchBloc>()
                        .add(SearchLocationQueried(querry: value));
                  },
                  style: textstyle,
                  cursorColor: const Color(0xFF3C3A3A),
                  decoration: const InputDecoration(
                    hintText: 'Search location...',
                    border: InputBorder.none,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  LineAwesomeIcons.search,
                  size: 32,
                  color: Color(0xFF3C3A3A),
                ),
              ),
            ],
          ),
          const Divider(
            height: 1,
            color: Color(0xFF3C3A3A),
          ),
        ],
      ),
    );
  }
}
