import 'package:flutter/material.dart';

import 'bubble.dart';

class BubbleButton extends StatelessWidget {
  const BubbleButton({
    super.key,
    this.onTap,
    this.margin,
    this.child,
  });

  final Function()? onTap;
  final EdgeInsetsGeometry? margin;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? const EdgeInsets.all(0),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          child: Bubble(
            width: 70,
            height: 70,
            child: child,
          ),
        ),
      ),
    );
  }
}
