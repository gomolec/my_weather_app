import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:my_weather_app/screens/home_screen/widgets/app_bar.dart';
import 'pages/pages.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<int> currentIndexPage = ValueNotifier<int>(0);

  @override
  void dispose() {
    currentIndexPage.dispose();
    super.dispose();
  }

  static const List<Widget> _pages = [
    MainPage(),
    DetailsPage(),
    HourlyPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB9A8A1),
      appBar: const CustomAppBar(title: "Location"),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              onPageChanged: (index) {
                currentIndexPage.value = index;
              },
              children: _pages,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: ValueListenableBuilder(
              valueListenable: currentIndexPage,
              builder: (context, int _currentIndexPage, child) {
                return DotsIndicator(
                  dotsCount: _pages.length,
                  position: _currentIndexPage.toDouble(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
