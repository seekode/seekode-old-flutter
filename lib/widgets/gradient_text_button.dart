import 'package:flutter/material.dart';

class GradientTextButton extends StatefulWidget {
  const GradientTextButton(this._text, {super.key});

  final String _text;

  @override
  State<GradientTextButton> createState() => _GradientTextButtonState();
}

class _GradientTextButtonState extends State<GradientTextButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _animationOne;
  late Animation<Color?> _animationTwo;
  late Animation<double> _animationSpace;
  late Animation<double> _animationUnderline;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );

    _animationOne = ColorTween(
      begin: const Color(0xFF734594),
      end: const Color(0xFFDF3A8C),
    ).animate(_controller);

    _animationTwo = ColorTween(
      begin: const Color(0xFFDF3A8C),
      end: const Color(0xFF734594),
    ).animate(_controller);

    _animationSpace = Tween<double>(
      begin: 5,
      end: 10,
    ).animate(_controller);

    _animationUnderline = Tween<double>(
      begin: 0,
      end: 100,
    ).animate(_controller);

    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return InkWell(
      onTap: () {},
      onHover: (value) => value ? _controller.forward() : _controller.reverse(),
      splashFactory: NoSplash.splashFactory,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      child: ShaderMask(
        blendMode: BlendMode.srcIn,
        shaderCallback: (bounds) => LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            _animationOne.value!,
            _animationTwo.value!,
          ],
        ).createShader(bounds),
        child: Stack(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget._text,
                  style: theme.textTheme.bodyMedium!.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    letterSpacing: .5,
                  ),
                ),
                SizedBox(height: 30, width: _animationSpace.value),
                const Padding(
                  padding: EdgeInsets.only(top: 4),
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 15,
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 1,
                width: _animationUnderline.value,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      _animationOne.value!,
                      _animationTwo.value!,
                    ],
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
