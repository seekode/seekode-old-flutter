import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../app_themes.dart';
import 'benefit_item.dart';

class WorkWithMe extends StatelessWidget {
  const WorkWithMe({super.key});

  Widget _expanded(screeWidth, {required Widget child}) =>
      screeWidth > 1024 ? Expanded(child: child) : child;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    final List<Map<String, String>> itemLeft = [
      {
        'title': AppLocalizations.of(context)!.servicesItem1Title,
        'description': AppLocalizations.of(context)!.servicesItem1text,
        'img': 'responsive',
      },
      {
        'title': AppLocalizations.of(context)!.servicesItem2Title,
        'description': AppLocalizations.of(context)!.servicesItem2Text,
        'img': 'design',
      },
      {
        'title': AppLocalizations.of(context)!.servicesItem3Title,
        'description': AppLocalizations.of(context)!.servicesItem3Text,
        'img': 'coding',
      },
    ];

    final List<Map<String, String>> itemRight = [
      {
        'title': AppLocalizations.of(context)!.servicesItem4Title,
        'description': AppLocalizations.of(context)!.servicesItem4Text,
        'img': 'tips',
      },
      {
        'title': AppLocalizations.of(context)!.servicesItem5Title,
        'description': AppLocalizations.of(context)!.servicesItem5Text,
        'img': 'support',
      },
      {
        'title': AppLocalizations.of(context)!.servicesItem6Title,
        'description': AppLocalizations.of(context)!.servicesItem6Text,
        'img': 'handshake',
      },
    ];

    return Row(
      children: [
        if (width > 700 && width <= 1024)
          Padding(
            padding: const EdgeInsets.all(20),
            child: Image.asset(
              'assets/images/services.png',
              width: responsiveValue(
                context,
                phone: 300,
                desktop: 300,
              ),
            ),
          ),
        Expanded(
          child: Flex(
            direction: width > 1024 ? Axis.horizontal : Axis.vertical,
            children: [
              _expanded(
                width,
                child: Column(
                  children: [
                    for (final item in itemLeft)
                      BenefitItem(
                        title: item['title']!,
                        description: item['description']!,
                        image: item['img']!,
                      ),
                  ],
                ),
              ),
              if (width <= 700 || width > 1024)
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Image.asset(
                    'assets/images/services.png',
                    width: responsiveValue(
                      context,
                      phone: 250,
                      tablet: 380,
                      desktop: 300,
                    ),
                  ),
                ),
              _expanded(
                width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    for (final item in itemRight)
                      BenefitItem(
                        title: item['title']!,
                        description: item['description']!,
                        image: item['img']!,
                        reverse: true,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
