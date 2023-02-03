import 'package:flutter/material.dart';

class Bubble extends StatelessWidget {
  const Bubble({
    super.key,
    this.width,
    this.height,
    this.margin,
    this.customColor,
    this.child,
  });

  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final Color? customColor;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return AnimatedContainer(
      width: width,
      height: height,
      margin: margin,
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            brightness == Brightness.dark
                ? const Color.fromARGB(255, 41, 38, 42)
                : customColor ?? Theme.of(context).colorScheme.background,
            brightness == Brightness.dark
                ? customColor ?? Theme.of(context).colorScheme.background
                : const Color.fromARGB(255, 220, 220, 220),
          ],
        ),
        boxShadow: [
          brightness != Brightness.dark
              ? const BoxShadow(
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
        borderRadius: const BorderRadius.all(Radius.circular(23)),
      ),
      child: child,
    );
  }
}
