import 'package:flutter/material.dart';
import 'components/components.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          SizedBox(height: 32.0),
          DetailsMainText(
            feelsTemp: -1.2,
            sunrise: "7:16",
            sunset: "15:29",
          ),
          SizedBox(height: 16.0),
          DetailsTable(),
        ],
      ),
    );
  }
}
