import 'package:flutter/material.dart';

class DetailsTableTile extends StatelessWidget {
  final IconData leadingIcon;
  final String title;
  final Widget? optionalWidget;
  final String value;

  const DetailsTableTile({
    Key? key,
    required this.leadingIcon,
    required this.title,
    this.optionalWidget,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      leadingIcon,
                      size: 24.0,
                    ),
                    const SizedBox(width: 8.0),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    (optionalWidget != null)
                        ? optionalWidget!
                        : const SizedBox(),
                    const SizedBox(width: 8.0),
                    Text(
                      value,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(
            height: 1.0,
            thickness: 1.0,
          ),
        ],
      ),
    );
  }
}
