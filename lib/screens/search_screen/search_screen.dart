import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

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
              title: 'Warszawa',
              subtitle: 'Wielkopolska, Polska',
              isFavorite: true,
            ),
            const LocationTile(
              title: 'Kraków',
              subtitle: 'Małopolska, Polska',
              isFavorite: true,
            ),
            const LocationTile(
              title: 'Katowice',
              subtitle: 'Śląsk, Polska',
              isFavorite: true,
            ),
          ],
        ),
      ),
    );
  }
}

class LocationTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isFavorite;

  const LocationTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.isFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                        title,
                        style: const TextStyle(
                          fontSize: 24,
                          color: Color(0xFF3C3A3A),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        subtitle,
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
              const Expanded(
                child: TextField(
                  style: textstyle,
                  cursorColor: Color(0xFF3C3A3A),
                  decoration: InputDecoration(
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
  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     child: Padding(
  //       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
  //       child: TextFormField(
  //         style: textstyle,
  //         cursorColor: const Color(0xFF3C3A3A),
  //         decoration: const InputDecoration(
  //           floatingLabelStyle: textstyle,
  //           labelStyle: textstyle,
  //           focusedBorder: border,
  //           enabledBorder: border,
  //           border: border,
  //           labelText: 'Search location...',
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
