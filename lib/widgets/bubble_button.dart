import 'package:flutter/material.dart';

import 'bubble.dart';

class BubbleButton extends StatefulWidget {
  const BubbleButton({
    super.key,
    this.onTap,
    this.width,
    this.height,
    this.constraints,
    this.margin,
    this.padding,
    this.borderRadius,
    this.lightShadow,
    this.child,
  }) : _defaultSquare = true;

  const BubbleButton.notDefaultSquare({
    super.key,
    this.onTap,
    this.width,
    this.height,
    this.constraints,
    this.margin,
    this.padding,
    this.borderRadius,
    this.lightShadow,
    this.child,
  }) : _defaultSquare = false;

  final Function()? onTap;
  final double? width;
  final double? height;
  final BoxConstraints? constraints;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  final BoxShadow? lightShadow;
  final Widget? child;

  final bool _defaultSquare;

  @override
  State<BubbleButton> createState() => _BubbleButtonState();
}

class _BubbleButtonState extends State<BubbleButton> {
  bool hover = false;

  @override
  void dispose() {
    hover = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.margin ?? const EdgeInsets.all(0),
      child: MouseRegion(
        cursor:
            widget.onTap != null ? SystemMouseCursors.click : MouseCursor.defer,
        onEnter: (_) =>
            widget.onTap != null ? setState(() => hover = true) : null,
        onExit: (_) =>
            widget.onTap != null ? setState(() => hover = false) : null,
        child: GestureDetector(
          onTap: () {
            if (widget.onTap != null) {
              widget.onTap!();
              setState(() => hover = true);
              Future.delayed(const Duration(milliseconds: 500), () {
                if (hover) setState(() => hover = false);
              });
            }
          },
          child: Bubble(
            width: !widget._defaultSquare ? null : widget.width ?? 70,
            height: !widget._defaultSquare ? null : widget.height ?? 70,
            constraints: widget.constraints,
            padding: widget.padding,
            borderRadius: widget.borderRadius,
            lightShadow: widget.lightShadow,
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
