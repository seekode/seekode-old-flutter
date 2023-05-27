import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../app_themes.dart';
import 'activity_item.dart';

class Activity extends StatelessWidget {
  const Activity(
      {super.key, required this.onTapDev, required this.onTapTrainings});

  final Function() onTapDev;
  final Function() onTapTrainings;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    // MediaQuery.of(context).

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
            AppLocalizations.of(context)!.activityDevelopment,
            'assets/images/freelance.png',
            onTap: () => Future.delayed(
              const Duration(milliseconds: 300),
              () => onTapDev(),
            ),
          ),
          SizedBox(
            height: width > 720 ? 0 : 20,
          ),
          ActivityItem(
            AppLocalizations.of(context)!.trainings,
            AppLocalizations.of(context)!.activityTrainings,
            'assets/images/training.png',
            reverse: true,
            onTap: () => Future.delayed(
              const Duration(milliseconds: 300),
              () => onTapTrainings(),
            ),
          ),
        ],
      ),
    );
  }
}
