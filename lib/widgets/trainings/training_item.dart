import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:seekode/app_themes.dart';
import 'package:seekode/widgets/bubble.dart';
import 'package:seekode/widgets/gradient_text_button.dart';

class TrainingItem extends StatelessWidget {
  const TrainingItem({
    super.key,
    required this.title,
    required this.description,
    required this.logo,
    required this.color,
  });

  final String title;
  final String description;
  final String logo;
  final String color;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    // final size = MediaQuery.of(context).size;

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
