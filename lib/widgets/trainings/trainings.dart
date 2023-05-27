import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../app_themes.dart';
import 'training_item.dart';

class Trainings extends StatelessWidget {
  const Trainings({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Size size = MediaQuery.of(context).size;

    final List<Map<String, String>> items = [
      {
        'title': 'SeeLearn',
        'description': AppLocalizations.of(context)!.trainingsSeeLearn,
        'link': '',
        'logo': 'seekorp',
        'color': 'ffcdc0d7',
      },
      {
        'title': 'YouTube',
        'description': AppLocalizations.of(context)!.trainingsYouTube,
        'link': 'https://www.youtube.com/@_seekode',
        'logo': 'youtube',
        'color': 'fff5a9a9',
      },
      {
        'title': 'Discord',
        'description': AppLocalizations.of(context)!.trainingsDiscord,
        'link': 'https://discord.gg/g494as8mxM',
        'logo': 'discord',
        'color': 'ffcccffc',
      },
    ];

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
              'Formations',
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
            direction: size.width > 900 ? Axis.horizontal : Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: items
                .map(
                  (item) => TrainingItem(
                    title: item['title']!,
                    description: item['description']!,
                    link: item['link']!,
                    logo: item['logo']!,
                    color: item['color']!,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
