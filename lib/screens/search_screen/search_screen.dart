import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import 'package:my_weather_app/bloc/search_bloc/location_bloc.dart';
import 'package:my_weather_app/extensions.dart';
import 'package:my_weather_app/models/location.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            BlocBuilder<LocationBloc, LocationState>(
              builder: (context, state) {
                if (state is LocationQuerried) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.responce.length,
                    itemBuilder: (context, index) {
                      return SearchListTile(
                        name: state.responce[index].name.toString(),
                        state: state.responce[index].state.toString(),
                        country: state.responce[index].country.toString(),
                        isSearched: true,
                        isFav: false,
                        onTap: () {
                          context.read<LocationBloc>().add(LocationSubmitted(
                              location: state.responce[index]));
                        },
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
            child: Text(
              'Favorite:',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        ),
      ],
    );
  }
}

class SearchListTile extends StatelessWidget {
  final bool isSearched;
  final bool? isFav;
  final void Function()? onTap;
  final String? name;
  final String? state;
  final String? country;

  const SearchListTile({
    Key? key,
    this.isSearched = false,
    this.isFav,
    this.onTap,
    this.name,
    this.state,
    this.country,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: isSearched == true
          ? const Icon(
              LineAwesomeIcons.map_signs,
              size: 32,
            )
          : null,
      title: name != null
          ? Text(
              name!.capitalize(),
              style: Theme.of(context).textTheme.headline6,
            )
          : null,
      subtitle: (country != null || state != null)
          ? Text(
              (() {
                String text = "";
                if (state != null) text += state!;
                if (country != null && state != null) text += ", ";
                if (country != null) text += country!;
                return text;
              }()),
              style: Theme.of(context).textTheme.subtitle2,
            )
          : null,
      trailing: isFav != null
          ? IconButton(
              onPressed: () {},
              icon: Icon(
                isFav == true
                    ? LineAwesomeIcons.heart_1
                    : LineAwesomeIcons.heart,
                size: 24,
              ),
            )
          : null,
      onTap: onTap,
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
        context.read<LocationBloc>().add(LocationSubmitted(location: location));
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
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Text(
                          location.country.toString(),
                          style: Theme.of(context).textTheme.subtitle2,
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
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              height: 1,
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatefulWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late TextEditingController _controller;
  late bool isEmpty;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    isEmpty = true;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: Icon(
                  LineAwesomeIcons.search,
                  size: 28,
                ),
              ),
              Expanded(
                child: TextField(
                  controller: _controller,
                  onChanged: (value) {
                    context
                        .read<LocationBloc>()
                        .add(LocationQueried(query: value));
                    if (value.isEmpty && isEmpty == false) {
                      setState(() {
                        isEmpty = true;
                      });
                    } else if (value.isNotEmpty && isEmpty == true) {
                      setState(() {
                        isEmpty = false;
                      });
                    }
                  },
                  style: Theme.of(context).textTheme.subtitle1,
                  cursorColor: const Color(0xFF3C3A3A),
                  decoration: const InputDecoration(
                    hintText: 'Search location...',
                    border: InputBorder.none,
                  ),
                ),
              ),
              isEmpty
                  ? IconButton(
                      onPressed: () {
                        context
                            .read<LocationBloc>()
                            .add(const GeolocationStarted());
                      },
                      icon: const Icon(
                        LineAwesomeIcons.map_marker,
                        size: 28,
                      ),
                    )
                  : IconButton(
                      onPressed: () {
                        setState(() {
                          _controller.clear();
                          isEmpty = true;
                        });
                      },
                      icon: const Icon(
                        LineAwesomeIcons.times,
                        size: 28,
                      ),
                    ),
            ],
          ),
          const Divider(
            height: 1,
          ),
        ],
      ),
    );
  }
}
