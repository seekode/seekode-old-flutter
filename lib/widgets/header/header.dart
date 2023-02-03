import 'package:flutter/material.dart';

import '../../app_themes.dart';
import 'header_actions.dart';
import 'header_background.dart';
import 'header_content.dart';
import 'header_title.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: double.infinity,
      height: responsiveValue(
        context,
        phone: width * .85 + 135,
        desktop: width * .54,
        bigger: {2500: 1325.53},
      ),
      child: Stack(
        children: const [
          HeaderBackground(),
          HeaderActions(),
          HeaderTitle(),
          HeaderContent(),
        ],
      ),
    );
  }
}
