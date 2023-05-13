import 'dart:ui';

import 'package:flutter/material.dart';
import '../../app_themes.dart';
import '../bubble.dart';
import 'item_sell.dart';

class Sell extends StatefulWidget {
  const Sell(this.primaryColor, this.secondaryColor, this.textColor,
      {super.key});

  final Color primaryColor;
  final Color secondaryColor;
  final Color textColor;

  @override
  State<Sell> createState() => _SellState();
}

class _SellState extends State<Sell> with SingleTickerProviderStateMixin {
  int activeItem = 0;
  int? previousItem;

  final List<Map<String, dynamic>> _items = [
    {
      'title': 'Coaching & formations',
      'icon': Icons.school_rounded,
    },
    {
      'title': 'Gestion de projets',
      'icon': Icons.account_tree_rounded,
    },
    {
      'title': 'Développement',
      'icon': Icons.data_object_rounded,
    },
  ];

  late AnimationController _controller;
  late Animation<Color?> _animationOne;
  late Animation<Color?> _animationTwo;
  late Animation<Color?> _animationOnePrevious;
  late Animation<Color?> _animationTwoPrevious;
  late Animation<double?> _iconSize;
  late Animation<double?> _iconSizePrevious;
  final int animationDuration = 300;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: animationDuration),
      vsync: this,
    );

    _animationOne = ColorTween(
      begin: widget.primaryColor,
      end: Colors.transparent,
    ).animate(_controller);

    _animationTwo = ColorTween(
      begin: widget.secondaryColor,
      end: Colors.transparent,
    ).animate(_controller);

    _animationOnePrevious = ColorTween(
      begin: Colors.transparent,
      end: widget.primaryColor,
    ).animate(_controller);

    _animationTwoPrevious = ColorTween(
      begin: Colors.transparent,
      end: widget.secondaryColor,
    ).animate(_controller);

    _iconSize = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(_controller);

    _iconSizePrevious = Tween<double>(
      begin: 0,
      end: 1,
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
    final double height = responsiveValue(
      context,
      phone: 120,
      tablet: 200,
      desktop: 250,
    );
    final Brightness brightness = Theme.of(context).brightness;

    final double fullHeight = height +
        responsiveValue(
          context,
          phone: 45,
          tablet: 50,
          desktop: 80,
          large: 100,
        );

    final double iconSize = responsiveValue(
      context,
      phone: 30,
      tablet: 50,
      desktop: 60,
      large: 80,
    );

    return Column(
      children: [
        SizedBox(
          height: fullHeight + 10,
          child: LayoutBuilder(builder: (_, constraints) {
            final double itemWidth = constraints.maxWidth / 3;
            return Stack(
              children: [
                Bubble(
                  width: double.infinity,
                  height: height,
                ),
                AnimatedPositioned(
                  left: itemWidth * activeItem,
                  duration: Duration(milliseconds: animationDuration),
                  curve: Curves.easeIn,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(23)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: brightness == Brightness.light ? 50 : 10,
                          spreadRadius: brightness == Brightness.light ? 2 : 5,
                        )
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(23)),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX:
                              Theme.of(context).brightness == Brightness.light
                                  ? 2
                                  : 3,
                          sigmaY:
                              Theme.of(context).brightness == Brightness.light
                                  ? 2
                                  : 3,
                        ),
                        child: Container(
                          width: itemWidth,
                          height: fullHeight,
                          color: brightness == Brightness.light
                              ? const Color.fromARGB(100, 255, 255, 255)
                              : const Color.fromARGB(116, 41, 38, 42),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: fullHeight,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (var i = 0; i < _items.length; i++)
                        ItemSell(
                          _items[i]['title'],
                          _items[i]['icon'],
                          i == activeItem,
                          width: itemWidth,
                          height: height,
                          titleHeight: fullHeight - height,
                          iconSize: (i == activeItem
                                  ? iconSize * _iconSize.value!
                                  : i == previousItem
                                      ? iconSize * _iconSizePrevious.value!
                                      : 0) +
                              responsiveValue(
                                context,
                                phone: 40,
                                tablet: 80,
                                desktop: 100,
                              ),
                          gradientOne: i == activeItem
                              ? _animationOne.value
                              : i == previousItem
                                  ? _animationOnePrevious.value
                                  : null,
                          gradientTwo: i == activeItem
                              ? _animationTwo.value
                              : i == previousItem
                                  ? _animationTwoPrevious.value
                                  : null,
                          onTap: () {
                            if (activeItem == i) return;
                            _controller.duration = Duration.zero;
                            _controller.forward();
                            setState(() {
                              previousItem = activeItem;
                              activeItem = i;
                            });
                            _controller.duration =
                                Duration(milliseconds: animationDuration);
                            _controller.reverse();
                            final isActive = previousItem;
                            Future.delayed(
                                Duration(milliseconds: animationDuration), () {
                              if (isActive == previousItem) {
                                setState(() {
                                  previousItem = null;
                                });
                              }
                            });
                          },
                        ),
                    ],
                  ),
                ),
              ],
            );
          }),
        ),
      ],
    );
  }
}
