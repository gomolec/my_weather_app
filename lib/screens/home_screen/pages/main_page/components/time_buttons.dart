import 'package:flutter/material.dart';

class TimeButtons extends StatelessWidget {
  final String timeBefore;
  final String timeAfter;

  const TimeButtons({
    Key? key,
    required this.timeBefore,
    required this.timeAfter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {},
          child: Text(
            timeBefore,
            style: Theme.of(context).textTheme.caption,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "now",
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            timeAfter,
            style: Theme.of(context).textTheme.caption,
          ),
        ),
      ],
    );
  }
}
