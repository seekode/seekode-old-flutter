import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../app_themes.dart';
import '../gradient_text_button.dart';

class ActivityItem extends StatelessWidget {
  const ActivityItem(
    this._title,
    this._description,
    this._img, {
    super.key,
    this.reverse,
  });

  final String _title;
  final String _description;
  final String _img;
  final bool? reverse;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        if (screenWidth <= 720) ...[
          Text(
            _title,
            style: theme.textTheme.titleSmall,
          ),
          const SizedBox(
            height: 20,
          ),
        ],
        LayoutBuilder(builder: (_, constraints) {
          final double width = constraints.maxWidth;
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            textDirection: reverse != null ? TextDirection.rtl : null,
            children: [
              SizedBox(
                width: width * responsiveValue(context, phone: .4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (screenWidth > 720) ...[
                      Text(
                        _title,
                        style: theme.textTheme.titleSmall,
                      ),
                      const SizedBox(height: 40),
                    ],
                    Text(_description, softWrap: true),
                    const SizedBox(height: 15),
                    GradientTextButton(AppLocalizations.of(context)!.discover),
                  ],
                ),
              ),
              SizedBox(
                width: width *
                    responsiveValue(
                      context,
                      phone: .05,
                      tablet: .1,
                      desktop: .15,
                    ),
              ),
              Image.asset(
                _img,
                width: width * responsiveValue(context, phone: .45),
              ),
            ],
          );
        }),
      ],
    );
  }
}
