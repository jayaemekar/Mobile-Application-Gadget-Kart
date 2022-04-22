import 'package:flutter/material.dart';

class HeadlineTitle extends StatelessWidget {
  const HeadlineTitle({
    Key? key,
    required this.title,
    required this.context,
    required this.screen,
  }) : super(key: key);
  final Widget screen;
  final String title;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline3,
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => screen,
                ),
              );
            },
            child:  const Text('See All'),
          )
        ],
      ),
    );
  }
}
