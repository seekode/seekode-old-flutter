import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../app_themes.dart';
import 'sell.dart';
import 'work_with_me.dart';

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
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
              AppLocalizations.of(context)!.servicesTitle,
              style: theme.textTheme.titleMedium,
            ),
          ),
          SizedBox(
            height: responsiveValue(
              context,
              phone: 10,
              tablet: 20,
              desktop: 60,
            ),
          ),
          SizedBox(
            width: responsiveValue(
              context,
              phone: double.infinity,
              desktop: 1200,
            ),
            child: Sell(
              theme.colorScheme.primary,
              theme.colorScheme.secondary,
              theme.textTheme.bodyMedium!.color!,
            ),
          ),
          SizedBox(
            height: responsiveValue(
              context,
              phone: 50,
              tablet: 100,
            ),
          ),
          Text(
            AppLocalizations.of(context)!.servicesWorkWithMeTitle,
            style: theme.textTheme.titleSmall,
          ),
          const SizedBox(height: 30),
          const WorkWithMe(),
        ],
      ),
    );
  }
}
