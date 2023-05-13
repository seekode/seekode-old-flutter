import 'package:flutter/material.dart';
import 'package:seekode/widgets/trainings/training_item.dart';

import '../../app_themes.dart';

class Trainings extends StatelessWidget {
  Trainings({super.key});

  final List<Map<String, String>> _items = [
    {
      'title': 'SeeLearn',
      'description':
          'SeeLearn est ma plate-forme de formation accessible aux débutant permettant l’apprentissage de la programmation sur diverses technologies.',
      'logo': 'seekorp',
      'color': 'ffcdc0d7',
    },
    {
      'title': 'YouTube',
      'description':
          'SeeLearn est ma plate-forme de formation accessible aux débutant permettant l’apprentissage de la programmation sur diverses technologies.',
      'logo': 'youtube',
      'color': 'fff5a9a9',
    },
    {
      'title': 'Discord',
      'description':
          'SeeLearn est ma plate-forme de formation accessible aux débutant permettant l’apprentissage de la programmation sur diverses technologies.',
      'logo': 'discord',
      'color': 'ffcccffc',
    },
  ];

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
            children: _items
                .map(
                  (item) => TrainingItem(
                    title: item['title']!,
                    description: item['description']!,
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
