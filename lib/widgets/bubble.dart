import 'package:flutter/material.dart';

class Bubble extends StatelessWidget {
  const Bubble({
    super.key,
    this.width,
    this.height,
    this.constraints,
    this.margin,
    this.padding,
    this.customColor,
    this.borderRadius,
    this.lightShadow,
    this.child,
  });

  final double? width;
  final double? height;
  final BoxConstraints? constraints;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Color? customColor;
  final BorderRadiusGeometry? borderRadius;
  final BoxShadow? lightShadow;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return AnimatedContainer(
      width: width,
      constraints: constraints,
      height: height,
      margin: margin,
      padding: padding,
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            brightness == Brightness.dark
                ? const Color.fromARGB(255, 45, 45, 45)
                : customColor ?? Theme.of(context).colorScheme.background,
            brightness == Brightness.dark
                ? customColor ?? Theme.of(context).colorScheme.background
                : const Color.fromARGB(255, 235, 235, 235),
          ],
        ),
        boxShadow: [
          brightness != Brightness.dark
              ? lightShadow ??
                  const BoxShadow(
                    color: Colors.black54,
                    blurRadius: 50,
                    spreadRadius: -10,
                  )
              : const BoxShadow(
                  color: Colors.black87,
                  blurRadius: 20,
                  spreadRadius: -10,
                ),
        ],
        borderRadius:
            borderRadius ?? const BorderRadius.all(Radius.circular(23)),
      ),
      child: child,
    );
  }
}
