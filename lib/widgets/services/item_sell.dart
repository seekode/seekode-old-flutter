import 'package:flutter/material.dart';
import 'package:seekode/app_themes.dart';

class ItemSell extends StatelessWidget {
  const ItemSell(
    this._title,
    this._icon,
    this.active, {
    super.key,
    this.width,
    this.height,
    this.titleHeight,
    this.iconSize,
    this.onTap,
    this.gradientOne,
    this.gradientTwo,
  });

  final String _title;
  final IconData _icon;
  final bool active;
  final double? width;
  final double? height;
  final double? titleHeight;
  final double? iconSize;
  final Function()? onTap;
  final Color? gradientOne;
  final Color? gradientTwo;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    const Duration duration = Duration(milliseconds: 200);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: duration,
        width: width,
        height: active ? height! + titleHeight! : height,
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: duration,
              height: active ? height! : iconSize,
              child: ShaderMask(
                blendMode: BlendMode.srcATop,
                shaderCallback: (bounds) => LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    gradientOne ?? theme.textTheme.bodyMedium!.color!,
                    gradientTwo ?? theme.textTheme.bodyMedium!.color!,
                  ],
                ).createShader(bounds),
                child: Icon(
                  _icon,
                  size: iconSize ??
                      responsiveValue(
                        context,
                        phone: 40,
                        tablet: 80,
                        desktop: 100,
                      ),
                ),
              ),
            ),
            AnimatedContainer(
              duration: duration,
              width: double.infinity,
              height: active
                  ? titleHeight
                  : responsiveValue(
                      context,
                      phone: 30,
                      tablet: 40,
                      desktop: 60,
                    ),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Center(
                child: Text(
                  _title,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontSize: responsiveValue(
                      context,
                      phone: 9,
                      tablet: 15,
                      desktop: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
