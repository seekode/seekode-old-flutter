import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../app_themes.dart';
import 'activity_item.dart';

class Activity extends StatelessWidget {
  const Activity({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width < 1024
          ? null
          : responsiveValue(
              context,
              phone: width * .8,
              large: width * .6,
              bigger: {2500: 1500},
            ),
      child: Column(
        children: [
          SizedBox(
            height: responsiveValue(
              context,
              phone: 40,
              desktop: 140,
              large: 180,
            ),
          ),
          ActivityItem(
            AppLocalizations.of(context)!.development,
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
            'assets/images/freelance.png',
          ),
          SizedBox(
            height: width > 720 ? 0 : 20,
          ),
          ActivityItem(
            AppLocalizations.of(context)!.trainings,
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
            'assets/images/training.png',
            reverse: true,
          ),
        ],
      ),
    );
  }
}
