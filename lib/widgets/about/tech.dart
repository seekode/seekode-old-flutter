import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../app_themes.dart';
import '../bubble.dart';

class Tech extends StatelessWidget {
  const Tech({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final List<String?> items = [
      null,
      null,
      null,
      null,
      'microsoft_teams',
      null,
      null,
      null,
      'responsive',
      'html',
      'figma',
      'trello',
      'git',
      'github',
      null,
      'sass',
      'css',
      null,
      null,
      'filezilla',
      null,
      'nuxtjs',
      'vuejs',
      'javascript',
      null,
      null,
      'vscode',
      'android_studio',
      null,
      size.width < 384 ? 'nuxtjs' : 'npm',
      'nodejs',
      'php',
      'dart',
      null,
      null,
      null,
      null,
      'mongodb',
      'firebase',
      'mysql',
    ];

    if (size.width < 384) {
      items.removeAt(0);
      items.removeAt(6);
      items.removeAt(12);
      items.removeAt(18);
      items.removeAt(24);
      items.removeAt(30);
    }

    final double bubbleSize = size.width < 440
        ? 45
        : responsiveValue(
            context,
            phone: 50,
            tablet: 70,
            desktop: 60,
            bigger: {
              1400: 80,
              1200: 70,
            },
          );

    final double flutterSize = size.width < 350
        ? 92
        : size.width < 440
            ? 95
            : responsiveValue(
                context,
                phone: 105,
                tablet: 145,
                desktop: 125,
                bigger: {
                  1400: 165,
                  1200: 145,
                },
              );

    final double spacing = size.width < 350 ? 2 : 5;

    final double borderRadius = responsiveValue(context, phone: 15, tablet: 25);

    return SizedBox(
      width: size.width < 440
          ? 345
          : responsiveValue(
              context,
              phone: 400,
              tablet: 540,
              desktop: 470,
              bigger: {
                1400: 650,
                1200: 540,
              },
            ),
      child: Stack(
        children: [
          Center(
            child: Wrap(
              spacing: spacing,
              runSpacing: spacing,
              children: items
                  .map(
                    (item) => item != null
                        ? Bubble(
                            width: bubbleSize,
                            height: bubbleSize,
                            padding: EdgeInsets.all(bubbleSize * .25),
                            borderRadius:
                                BorderRadius.all(Radius.circular(borderRadius)),
                            lightShadow: const BoxShadow(
                              color: Colors.black54,
                              blurRadius: 20,
                              spreadRadius: -10,
                            ),
                            child: SvgPicture.asset(
                              'assets/images/about/$item.svg',
                            ),
                          )
                        : SizedBox(
                            width: bubbleSize,
                            height: bubbleSize,
                          ),
                  )
                  .toList(),
            ),
          ),
          Center(
            child: Wrap(
              spacing: spacing,
              runSpacing: spacing,
              children: [
                for (int i = 0; i < (size.width < 384 ? 14 : 17); i++)
                  SizedBox(
                    width: bubbleSize,
                    height: bubbleSize,
                  ),
                Bubble(
                  width: flutterSize,
                  height: flutterSize,
                  padding: EdgeInsets.all(flutterSize * .2),
                  borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                  lightShadow: const BoxShadow(
                    color: Colors.black54,
                    blurRadius: 12,
                    spreadRadius: -7,
                  ),
                  child: SvgPicture.asset(
                    'assets/images/about/flutter.svg',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
