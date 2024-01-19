import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../app_themes.dart';
import '../../providers/toast/toast_state.dart';
import '../bubble.dart';
import '../gradient_text_button.dart';

class TrainingItem extends ConsumerWidget {
  const TrainingItem({
    super.key,
    required this.title,
    required this.description,
    required this.link,
    required this.logo,
    required this.color,
  });

  final String title;
  final String description;
  final String link;
  final String logo;
  final String color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = Theme.of(context);

    final double width = responsiveValue(
      context,
      phone: 330,
      tablet: 400,
      bigger: {
        1400: 380,
        1150: 320,
        1024: 285,
        900: 250,
      },
    );

    return Bubble(
      width: width,
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            width: width,
            height: width * 0.8,
            decoration: BoxDecoration(
              color: Color(int.parse(color, radix: 16)),
              borderRadius: const BorderRadius.all(Radius.circular(23)),
            ),
            child: Center(
              child: SizedBox(
                width: width / 2,
                height: (width * 0.8) / 2,
                child: SvgPicture.asset(
                  'assets/images/trainings/$logo.svg',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    style: theme.textTheme.titleSmall,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: theme.textTheme.bodySmall,
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: GradientTextButton(
                    AppLocalizations.of(context)!.discover,
                    onTap: () async {
                      if (link.isNotEmpty) {
                        final Uri url = Uri.parse(link);
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        }
                      } else {
                        ref
                            .read(toastStateProvider.notifier)
                            .set(AppLocalizations.of(context)!.featureInDev);
                      }
                    },
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
