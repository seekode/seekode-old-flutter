import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../app_themes.dart';

class HeaderBackground extends StatelessWidget {
  const HeaderBackground({super.key});

  double? _squareSize(BuildContext context, String type) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    
    switch (type) {
      case 'width':
        return responsiveValue(
          context,
          phone: .85,
          desktop: .75,
        );
      case 'height':
        return responsiveValue(
          context,
          phone: .8,
          desktop: .7,
        );
      case 'top':
        return responsiveValue(
          context,
          phone: orientation == Orientation.portrait ? -.25 : -.3,
          desktop: -.29,
        );
      case 'left':
        return responsiveValue(
          context,
          phone: -.20,
          desktop: -.15,
        );
      case 'topLogo':
        return responsiveValue(
          context,
          phone: orientation == Orientation.portrait ? 0.1 : 0.02,
          desktop: 0.039,
        );
      case 'leftLogo':
        return responsiveValue(
          context,
          phone: 0.59,
          bigger: {3000: 0.65},
        );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Positioned(
            top: width > 2500 ? -725.29 : width * _squareSize(context, 'top')!,
            left:
                width > 2500 ? -375.15 : width * _squareSize(context, 'left')!,
            child: Transform.rotate(
              angle: -0.470,
              child: Container(
                width: width > 2500
                    ? 1875.75
                    : width * _squareSize(context, 'width')!,
                height: width > 2500
                    ? 1750.6999999999998
                    : width * _squareSize(context, 'height')!,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(responsiveValue(
                      context,
                      phone: 35,
                      tablet: 75,
                      desktop: 120,
                    )),
                  ),
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
            ),
          ),
          Positioned(
            top: width > 2500
                ? -825.3299999999999
                : width * _squareSize(context, 'top')! - width * .04,
            left: width > 2500
                ? -355.142
                : width * _squareSize(context, 'left')! + width * .008,
            child: Transform.rotate(
              angle: -0.470,
              child: Container(
                width: width > 2500
                    ? 1875.75
                    : width * _squareSize(context, 'width')!,
                height: width > 2500
                    ? 1750.6999999999998
                    : width * _squareSize(context, 'height')!,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      responsiveValue(
                        context,
                        phone: 30,
                        tablet: 60,
                        desktop: 100,
                      ),
                    ),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.secondary,
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: width > 2500
                ? 97.539
                : width * _squareSize(context, 'topLogo')!,
            left: width * _squareSize(context, 'leftLogo')!,
            child: SvgPicture.asset(
              'assets/images/logo.svg',
              width: width > 3000
                  ? 900
                  : width * responsiveValue(context, phone: .35, desktop: .25),
            ),
          ),
        ],
      ),
    );
  }
}
