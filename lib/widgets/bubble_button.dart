import 'package:flutter/material.dart';

import 'bubble.dart';

class BubbleButton extends StatefulWidget {
  const BubbleButton({
    super.key,
    this.onTap,
    this.width,
    this.height,
    this.margin,
    this.child,
  });

  final Function()? onTap;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final Widget? child;

  @override
  State<BubbleButton> createState() => _BubbleButtonState();
}

class _BubbleButtonState extends State<BubbleButton> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.margin ?? const EdgeInsets.all(0),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => hover = true),
        onExit: (_) => setState(() => hover = false),
        child: GestureDetector(
          onTap: () {
            if (widget.onTap != null) widget.onTap!();
            setState(() => hover = true);
            Future.delayed(const Duration(milliseconds: 500), () {
              setState(() => hover = false);
            });
          },
          child: Bubble(
            width: widget.width ?? 70,
            height: widget.height ?? 70,
            customColor: hover
                ? Theme.of(context).brightness == Brightness.dark
                    ? const Color.fromARGB(255, 71, 67, 73)
                    : const Color.fromARGB(255, 180, 180, 180)
                : null,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
