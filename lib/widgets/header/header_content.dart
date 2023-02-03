import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../app_themes.dart';

class HeaderContent extends StatelessWidget {
  const HeaderContent({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    final Brightness brightness = Theme.of(context).brightness;
    return Column(
      children: [
        SizedBox(
          height: width > 2500
              ? 750.3
              : width *
                  responsiveValue(
                    context,
                    phone: .55,
                    desktop: .3,
                  ),
        ),
        Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(23)),
              boxShadow: [
                if (width <= 1024)
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: brightness == Brightness.light ? 20 : 10,
                    spreadRadius: brightness == Brightness.light ? 0 : 5,
                  ),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(23)),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: responsiveValue(context, phone: 4, desktop: 0),
                  sigmaY: responsiveValue(context, phone: 4, desktop: 0),
                ),
                child: Container(
                  width: width * .9,
                  padding: width > 1024
                      ? null
                      : const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 30,
                        ),
                  color: width > 1024
                      ? null
                      : brightness == Brightness.light
                          ? const Color.fromARGB(100, 255, 255, 255)
                          : const Color.fromARGB(116, 41, 38, 42),
                  child: Row(
                    mainAxisAlignment: width > 1024
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: width > 2500
                            ? 500.2
                            : width *
                                responsiveValue(
                                  context,
                                  desktop: .2,
                                ),
                      ),
                      Image.asset(
                        'assets/images/header.png',
                        width: width > 2500 ? 750.3 : width * .3,
                      ),
                      SizedBox(
                          width:
                              responsiveValue(context, phone: 10, desktop: 30)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nicolas Texier',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  fontSize: responsiveValue(
                                    context,
                                    phone: 18,
                                    tablet: 35,
                                    desktop: 49,
                                    large: 70,
                                  ),
                                  letterSpacing: responsiveValue(
                                    context,
                                    phone: 2,
                                    tablet: 5,
                                  ),
                                  height: 1,
                                ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: responsiveValue(
                                context,
                                phone: 8,
                                tablet: 15,
                                desktop: 20,
                              ),
                            ),
                            child: Text(
                              AppLocalizations.of(context)!.headerExperiences,
                              style: width > 600
                                  ? width > 1024
                                      ? width <= 1300
                                          ? null
                                          : Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(fontSize: 20)
                                      : Theme.of(context).textTheme.bodyLarge
                                  : Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                          SizedBox(
                            height: responsiveValue(
                              context,
                              phone: 20,
                              tablet: 30,
                              desktop: 40,
                            ),
                          ),
                          Text(
                            AppLocalizations.of(context)!.headerContent,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  fontSize: responsiveValue(
                                    context,
                                    phone: 10,
                                    tablet: 16,
                                    desktop: 25,
                                    large: 30,
                                  ),
                                ),
                          ),
                          SizedBox(
                            height: responsiveValue(
                              context,
                              tablet: 10,
                              desktop: width > 1350
                                  ? width > 2400
                                      ? 100
                                      : 20
                                  : 0,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
