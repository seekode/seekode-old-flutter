import 'package:flutter/material.dart';

import '../app_themes.dart';

class BackgroundSquare extends StatelessWidget {
  const BackgroundSquare({
    super.key,
    this.top,
    this.left,
    this.right,
    this.size,
    this.gradient = false,
    this.gradientBegin,
    this.gradientEnd,
  });

  final double? top;
  final double? right;
  final double? left;
  final double? size;
  final bool gradient;
  final AlignmentGeometry? gradientBegin;
  final AlignmentGeometry? gradientEnd;

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

    return Positioned(
      top: top,
      right: right,
      left: left,
      child: Transform.rotate(
        angle: -0.470,
        child: Container(
          width: size ??
              (width > 2500 ? 1875.75 : width * _squareSize(context, 'width')!),
          height: size ??
              (width > 2500
                  ? 1750.6999999999998
                  : width * _squareSize(context, 'height')!),
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
            gradient: gradient
                ? LinearGradient(
                    begin: gradientBegin ?? Alignment.bottomLeft,
                    end: gradientEnd ?? Alignment.centerRight,
                    colors: [
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.secondary,
                    ],
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
