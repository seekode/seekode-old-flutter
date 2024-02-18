import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';

import '../../app_themes.dart';
import '../../classes/hero_dialog_route.dart';
import '../bubble_button.dart';
import 'tech_modal.dart';

class Tech extends StatelessWidget {
  const Tech({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    bool localNameFr = AppLocalizations.of(context)!.localeName == 'fr';

    final List<TechItem?> items = [
      null,
      null,
      null,
      null,
      TechItem(
        'microsoft_teams',
        AppLocalizations.of(context)!.techTeams,
        'https://www.microsoft.com/${localNameFr ? 'fr-fr' : 'en-us'}/microsoft-teams/group-chat-software/',
      ),
      null,
      null,
      null,
      TechItem(
        'responsive',
        AppLocalizations.of(context)!.techResponsive,
        'https://developer.mozilla.org/${localNameFr ? 'fr' : 'en-US'}/docs/Learn/CSS/CSS_layout/Responsive_Design',
      ),
      TechItem(
        'html',
        AppLocalizations.of(context)!.techHtml,
        'https://developer.mozilla.org/${localNameFr ? 'fr' : 'en-US'}/docs/Web/HTML',
      ),
      TechItem(
        'figma',
        AppLocalizations.of(context)!.techFigma,
        'https://www.figma.com/${localNameFr ? 'fr/' : ''}',
      ),
      TechItem(
        'trello',
        AppLocalizations.of(context)!.techTrello,
        'https://trello.com/${localNameFr ? 'fr' : ''}',
      ),
      TechItem(
        'git',
        AppLocalizations.of(context)!.techGit,
        'https://git-scm.com/',
      ),
      TechItem(
        'github',
        AppLocalizations.of(context)!.techGithub,
        'https://github.com/',
      ),
      null,
      TechItem(
        'sass',
        AppLocalizations.of(context)!.techSass,
        'https://sass-lang.com/',
      ),
      TechItem(
        'css',
        AppLocalizations.of(context)!.techCss,
        'https://developer.mozilla.org/${localNameFr ? 'fr' : 'en-US'}/docs/Learn/Getting_started_with_the_web/CSS_basics',
      ),
      null,
      null,
      TechItem(
        'filezilla',
        AppLocalizations.of(context)!.techFilezilla,
        'https://filezilla-project.org/',
      ),
      null,
      TechItem(
        'react-native',
        AppLocalizations.of(context)!.techReactNative,
        'https://reactnative.dev/',
      ),
      TechItem(
        'react',
        AppLocalizations.of(context)!.techReact,
        'https://${localNameFr ? 'fr.' : ''}react.dev/',
      ),
      TechItem(
        'javascript',
        AppLocalizations.of(context)!.techJavascript,
        'https://developer.mozilla.org/${localNameFr ? 'fr' : 'en-US'}/docs/Learn/JavaScript',
      ),
      null,
      null,
      TechItem(
        'vscode',
        AppLocalizations.of(context)!.techVsc,
        'https://code.visualstudio.com/',
      ),
      TechItem(
        'android_studio',
        AppLocalizations.of(context)!.techAndroidStudio,
        'https://developer.android.com/',
      ),
      null,
      TechItem(
        size.width < 384 ? 'react-native' : 'wordpress',
        size.width < 384
            ? AppLocalizations.of(context)!.techReactNative
            : AppLocalizations.of(context)!.techWordpress,
        size.width < 384
            ? 'https://reactnative.dev/'
            : 'https://wordpress.com/${localNameFr ? 'fr/' : ''}',
      ),
      TechItem(
        'nodejs',
        AppLocalizations.of(context)!.techNodejs,
        'https://nodejs.org/${localNameFr ? 'fr' : 'en'}/about',
      ),
      TechItem(
        'php',
        AppLocalizations.of(context)!.techPhp,
        'https://www.php.net/',
      ),
      TechItem(
        'dart',
        AppLocalizations.of(context)!.techDart,
        'https://dart.dev/',
      ),
      size.width < 384
          ? TechItem(
              'wordpress',
              AppLocalizations.of(context)!.techWordpress,
              'https://wordpress.com/${localNameFr ? 'fr/' : ''}',
            )
          : null,
      null,
      null,
      null,
      TechItem(
        'mongodb',
        AppLocalizations.of(context)!.techMongoDB,
        'https://www.mongodb.com/${localNameFr ? 'fr-fr/' : ''}',
      ),
      TechItem(
        'firebase',
        AppLocalizations.of(context)!.techFirebase,
        'https://firebase.google.com/',
      ),
      TechItem(
        'mysql',
        AppLocalizations.of(context)!.techMySql,
        'https://www.mysql.com/',
      ),
    ];

    if (size.width < 384) {
      items.removeAt(0);
      items.removeAt(6);
      items.removeAt(12);
      items.removeAt(18);
      items.removeAt(24);
      items.removeAt(30);
    }

    final double bubbleSize = size.width < 440
        ? 45
        : responsiveValue(
            context,
            phone: 50,
            tablet: 70,
            desktop: 60,
            bigger: {
              1400: 80,
              1200: 70,
            },
          );

    final double flutterSize = size.width < 350
        ? 92
        : size.width < 440
            ? 95
            : responsiveValue(
                context,
                phone: 105,
                tablet: 145,
                desktop: 125,
                bigger: {
                  1400: 165,
                  1200: 145,
                },
              );

    final double spacing = size.width < 350 ? 2 : 5;

    final double borderRadius = responsiveValue(context, phone: 15, tablet: 25);

    return SizedBox(
      width: size.width < 440
          ? 345
          : responsiveValue(
              context,
              phone: 400,
              tablet: 540,
              desktop: 470,
              bigger: {
                1400: 650,
                1200: 540,
              },
            ),
      child: Stack(
        children: [
          Center(
            child: Wrap(
              spacing: spacing,
              runSpacing: spacing,
              children: items
                  .map(
                    (item) => item != null
                        ? Hero(
                            tag: item.tag,
                            child: BubbleButton(
                              width: bubbleSize,
                              height: bubbleSize,
                              padding: EdgeInsets.all(bubbleSize * .25),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(borderRadius)),
                              lightShadow: const BoxShadow(
                                color: Colors.black54,
                                blurRadius: 20,
                                spreadRadius: -10,
                              ),
                              onTap: () {
                                Navigator.of(context).push(
                                  HeroDialogRoute(
                                    builder: (context) => TechModal(
                                      item: item.tag,
                                      text: item.text,
                                      doc: item.doc,
                                      initialSize: bubbleSize,
                                      initialPadding: bubbleSize * .25,
                                      initialBorderRadius: borderRadius,
                                    ),
                                  ),
                                );
                              },
                              child: SvgPicture.asset(
                                'assets/images/about/${item.tag}.svg',
                              ),
                            ),
                          )
                        : SizedBox(
                            width: bubbleSize,
                            height: bubbleSize,
                          ),
                  )
                  .toList(),
            ),
          ),
          Center(
            child: Wrap(
              spacing: spacing,
              runSpacing: spacing,
              children: [
                for (int i = 0; i < (size.width < 384 ? 14 : 17); i++)
                  SizedBox(
                    width: bubbleSize,
                    height: bubbleSize,
                  ),
                Hero(
                  tag: 'flutter',
                  child: BubbleButton(
                    width: flutterSize,
                    height: flutterSize,
                    padding: EdgeInsets.all(flutterSize * .2),
                    borderRadius:
                        BorderRadius.all(Radius.circular(borderRadius)),
                    lightShadow: const BoxShadow(
                      color: Colors.black54,
                      blurRadius: 12,
                      spreadRadius: -7,
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        HeroDialogRoute(
                          builder: (context) => TechModal(
                            item: 'flutter',
                            text: AppLocalizations.of(context)!.techFlutter,
                            doc: 'https://flutter.dev/',
                            initialSize: flutterSize,
                            initialPadding: flutterSize * .2,
                            initialBorderRadius: borderRadius,
                          ),
                        ),
                      );
                    },
                    child: SvgPicture.asset(
                      'assets/images/about/flutter.svg',
                    ),
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

class TechItem {
  TechItem(this.tag, this.text, this.doc);

  String tag;
  String text;
  String doc;
}
