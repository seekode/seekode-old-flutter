import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../app_themes.dart';
import '../providers/language/language.dart';
import '../providers/theme/theme_state.dart';
import '../widgets/about/about.dart';
import '../widgets/activity/activity.dart';
import '../widgets/background_square.dart';
import '../widgets/bubble_button.dart';
import '../widgets/header/header.dart';
import '../widgets/services/services.dart';
import '../widgets/trainings/trainings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final double? iconSize = 30;
  // late ScrollController _scrollController;

  /// generate an icon to display in the theme button
  Widget _themeIcon(BuildContext context, ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.system:
        return ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (bounds) => const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFFFAC33),
              Color(0xFFE1E1E1),
            ],
          ).createShader(bounds),
          child: Icon(
            Icons.brightness_4_rounded,
            size: iconSize,
            color: Theme.of(context).primaryColor,
          ),
        );
      case ThemeMode.light:
        return Icon(
          Icons.brightness_7_rounded,
          size: iconSize,
          color: const Color(0xFFFFAC33),
        );
      default:
        return Icon(
          Icons.brightness_2_rounded,
          size: iconSize,
          color: const Color(0xFFE1E1E1),
        );
    }
  }

  /// The modalBottomSheet that allows to change the language of the app
  void showLanguageModal(BuildContext context) {
    SizedBox item(WidgetRef ref, String countryCode, String country) {
      return SizedBox(
        width: 200,
        child: TextButton(
          onPressed: () {
            ref.read(languageProvider.notifier).set(countryCode);
            Navigator.of(context).pop();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(3)),
                child: SvgPicture.asset(
                  'assets/images/flags/$countryCode.svg',
                  width: iconSize,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  country,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ],
          ),
        ),
      );
    }

    final Brightness brightness = Theme.of(context).brightness;
    showModalBottomSheet(
      context: context,
      constraints: const BoxConstraints(
        minWidth: double.infinity,
      ),
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
      elevation: 0,
      builder: (context) => Container(
        padding: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(23),
            topRight: Radius.circular(23),
          ),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(12, 0, 0, 0),
              blurRadius: brightness == Brightness.light ? 10 : 0,
              spreadRadius: brightness == Brightness.light ? 10 : 0,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(23),
            topRight: Radius.circular(23),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              height: 300,
              color: brightness == Brightness.light
                  ? const Color.fromARGB(100, 255, 255, 255)
                  : const Color.fromARGB(116, 41, 38, 42),
              child: Consumer(
                builder: (context, ref, _) => SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      item(ref, 'fr', 'Français'),
                      item(ref, 'en', 'English'),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    final double firstSquareTop = responsiveValue(
      context,
      phone: 700,
      tablet: 800,
      bigger: {
        2500: 1600,
        2000: 1400,
        1600: 1300,
        1500: 1200,
        1400: 1130,
        1200: 1000,
        1024: 800,
        900: 1040,
        700: 900,
      },
    );
    final double firstSquareLeft = width < 2000 ? width - 20 : width - 200;

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Stack(
              children: [
                BackgroundSquare(
                  top: firstSquareTop +
                      responsiveValue(
                        context,
                        phone: 30,
                        desktop: 40,
                        large: 50,
                      ),
                  left: firstSquareLeft -
                      responsiveValue(
                        context,
                        phone: 10,
                        desktop: 15,
                        large: 20,
                      ),
                ),
                BackgroundSquare(
                  top: firstSquareTop,
                  left: firstSquareLeft,
                  gradient: true,
                  gradientBegin: Alignment.topLeft,
                  gradientEnd: Alignment.bottomLeft,
                ),
                BackgroundSquare(
                  size: 1000,
                  top: responsiveValue(
                    context,
                    phone: 880,
                    bigger: {
                      2200: 2700,
                      2000: 2400,
                      1800: 2200,
                      1500: 2000,
                      1200: 1800,
                      1024: 1450,
                      900: 1800,
                      800: 1600,
                      700: 1400,
                      600: 1300,
                      500: 1000,
                    },
                    // tablet: 1600,
                  ),
                  right: responsiveValue(
                    context,
                    phone: 400,
                    bigger: {
                      2000: width - 250,
                      1800: width - 200,
                      700: width - 100,
                      500: width,
                      400: 450,
                    },
                  ),
                ),
                BackgroundSquare(
                  size: 1500,
                  top: responsiveValue(
                    context,
                    phone: 2000,
                    tablet: 2400,
                    bigger: {
                      2800: 4000,
                      2200: 3700,
                      2000: 3400,
                      1800: 3200,
                      1500: 3000,
                      1300: 2800,
                      1150: 2600,
                      1024: 2400,
                      900: 3000,
                      700: 2650,
                    },
                  ),
                  left: responsiveValue(
                    context,
                    phone: width,
                    tablet: width - 100,
                    bigger: {
                      2500: width - 400,
                      2200: width - 300,
                      700: width - 200,
                    },
                  ),
                ),
                if (width < 900)
                  BackgroundSquare(
                    size: 1000,
                    top: responsiveValue(
                      context,
                      phone: 3200,
                      tablet: 4000,
                      bigger: {
                        800: 4000,
                        700: 3800,
                      },
                    ),
                    right: responsiveValue(
                      context,
                      phone: width - 50,
                      bigger: {
                        700: width - 100,
                        500: width - 200,
                        350: width - 100,
                      },
                    ),
                  ),
                if (width < 900)
                  BackgroundSquare(
                    size: 1000,
                    top: responsiveValue(
                      context,
                      phone: 5050,
                      bigger: {
                        800: 5300,
                        700: 5200,
                        600: 5550,
                        550: 5000,
                        500: 4950,
                        450: 4900,
                        350: 4950,
                      },
                    ),
                    left: responsiveValue(
                      context,
                      phone: width - 20,
                      bigger: {
                        800: width - 180,
                        700: width - 150,
                        600: width - 70,
                        550: width - 50,
                        500: width - 30,
                      },
                    ),
                  ),
                Column(
                  children: [
                    const Header(),
                    const Activity(),
                    const SizedBox(height: 80),
                    const Services(),
                    const SizedBox(height: 80),
                    Trainings(),
                    const SizedBox(height: 80),
                    const About(),
                    const SizedBox(height: 800),
                  ],
                ),
              ],
            ),
          ),
          // LanguageBtn and ThemeBtn
          Positioned(
            bottom: 0,
            child: Column(
              children: [
                BubbleButton(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  onTap: () => showLanguageModal(context),
                  child: Center(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(3)),
                      child: SvgPicture.asset(
                        'assets/images/flags/${AppLocalizations.of(context)!.key}.svg',
                        width: iconSize,
                      ),
                    ),
                  ),
                ),
                Consumer(
                  builder: (context, ref, _) => BubbleButton(
                    margin: const EdgeInsets.all(10),
                    onTap: () => ref.read(themeStateProvider.notifier).toogle(),
                    child: _themeIcon(context, ref.watch(themeStateProvider)),
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
