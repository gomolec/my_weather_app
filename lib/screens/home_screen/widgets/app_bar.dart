import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onPressed;
  const CustomAppBar({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              LineAwesomeIcons.bars,
            ),
          ),
          centerTitle: true,
          title: TextButton(
            onPressed: onPressed,
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {},
              child: Text(
                "°C",
                style: Theme.of(context).textTheme.headline6,
              ),
            )
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
