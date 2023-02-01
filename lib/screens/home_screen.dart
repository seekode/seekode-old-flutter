import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../providers/language/language.dart';
import '../providers/theme/theme_state.dart';
import '../widgets/bubble_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final double? iconSize = 30;

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
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
      elevation: 0,
      builder: (context) => ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: Container(
            height: 300,
            margin: const EdgeInsets.only(top: 19),
            decoration: BoxDecoration(
              color: brightness == Brightness.light
                  ? const Color.fromARGB(100, 255, 255, 255)
                  : const Color.fromARGB(99, 41, 38, 42),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(23),
                topRight: Radius.circular(23),
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(12, 0, 0, 0),
                  blurRadius: 10,
                  spreadRadius: 10,
                  blurStyle: BlurStyle.normal,
                ),
              ],
            ),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const SizedBox(
            width: double.infinity,
            height: double.infinity,
          ),
          // LanguageBtn and ThemeBtn
          Positioned(
            bottom: 0,
            child: Column(
              children: [
                BubbleButton(
                  onTap: () => showLanguageModal(context),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
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
                    onTap: () => ref.read(themeStateProvider.notifier).toogle(),
                    margin: const EdgeInsets.all(10),
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
