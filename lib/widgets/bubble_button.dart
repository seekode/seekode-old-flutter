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
      child: InkWell(
        mouseCursor: SystemMouseCursors.click,
        onTap: () {},
        onHover: (value) {
          setState(() => hover = value);
        },
        borderRadius: const BorderRadius.all(Radius.circular(23)),
        child: GestureDetector(
          onTap: widget.onTap,
          child: Bubble(
            width: widget.width ?? 70,
            height: widget.height ?? 70,
            customColor: hover
                ? Theme.of(context).brightness == Brightness.dark
                    ? const Color.fromARGB(255, 41, 38, 42)
                    : Theme.of(context).colorScheme.background
                : null,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
