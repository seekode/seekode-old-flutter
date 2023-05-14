import 'package:flutter/material.dart';
import 'package:seekode/widgets/about/seekode.dart';
import 'package:seekode/widgets/about/tech.dart';

import '../../app_themes.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: responsiveValue(
        context,
        phone: MediaQuery.of(context).size.width * .9,
        large: 1500,
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'A propos',
              style: theme.textTheme.titleMedium,
            ),
          ),
          SizedBox(
            height: responsiveValue(
              context,
              phone: 10,
              tablet: 20,
              desktop: 40,
            ),
          ),
          Flex(
            direction: size.width > 1024 ? Axis.horizontal : Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: size.width > 1024
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
            children: size.width > 1024
                ? const [
                    Expanded(
                      child: Seekode(),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Tech(),
                  ]
                : const [
                    Seekode(),
                    SizedBox(
                      height: 40,
                    ),
                    Tech(),
                  ],
          ),
        ],
      ),
    );
  }
}
