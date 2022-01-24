import 'package:flutter/material.dart';
import 'components/components.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const DetailsMainText(
            feelsTemp: -1.2,
            sunrise: "7:16",
            sunset: "15:29",
          ),
          const SizedBox(height: 16.0),
          SizedBox(
            height: (MediaQuery.of(context).size.height / 2).roundToDouble(),
            //TODO Add information this is scrollable object
            child: const SingleChildScrollView(
              child: DetailsTable(),
            ),
          ),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }
}
