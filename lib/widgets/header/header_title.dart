import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../app_themes.dart';

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final Orientation orientation = MediaQuery.of(context).orientation;

    return Column(
      children: [
        SizedBox(
          height: width > 2500
              ? 350.14
              : width *
                  responsiveValue(
                    context,
                    phone: orientation == Orientation.portrait ? .25 : .15,
                    desktop: .14,
                  ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: responsiveValue(
              context,
              phone: 10,
              tablet: 20,
              desktop: 50,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'seekode',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: responsiveValue(
                        context,
                        phone: 31,
                        tablet: 55,
                        desktop: 85,
                        large: 140,
                      ),
                      height: 0.7,
                    ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  AppLocalizations.of(context)!.headerSubtitle,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: responsiveValue(
                          context,
                          phone: 9,
                          tablet: 15,
                          desktop: 24,
                          large: 40,
                        ),
                        height: 0,
                      ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
