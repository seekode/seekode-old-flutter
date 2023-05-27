import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../app_themes.dart';
import '../bubble_button.dart';
import '../gradient_text_button.dart';

enum Animate {
  animationIn,
  animationOut,
  open,
  close,
}

class TechModal extends StatefulWidget {
  const TechModal({
    super.key,
    required this.item,
    required this.text,
    required this.doc,
    required this.initialSize,
    required this.initialPadding,
    required this.initialBorderRadius,
  });

  final String item;
  final String text;
  final String doc;
  final double initialSize;
  final double initialPadding;
  final double initialBorderRadius;

  @override
  State<TechModal> createState() => _TechModalState();
}

class _TechModalState extends State<TechModal> {
  Animate state = Animate.animationIn;
  double? height;
  double? width;
  final GlobalKey textKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 350), () {
      if (state == Animate.animationIn) {
        setState(() {
          state = Animate.open;
          if (textKey.currentContext?.findRenderObject() != null) {
            RenderBox renderBox =
                textKey.currentContext!.findRenderObject() as RenderBox;
            height = renderBox.size.height + 80 + widget.initialPadding * 2;
          } else {
            height = 200;
          }
          width = getWidth(context);
        });
      }
    });
  }

  double getWidth(BuildContext context) => responsiveValue(
        context,
        phone: MediaQuery.of(context).size.width * .9,
        desktop: 1024,
      );

  void close() {
    setState(() {
      state = Animate.animationOut;
    });
    Future.delayed(const Duration(milliseconds: 350), () {
      if (state == Animate.animationOut) Navigator.of(context).pop();
      state = Animate.close;
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme theme = Theme.of(context).textTheme;

    double initialLogoSize = responsiveValue(
      context,
      phone: 60,
      tablet: 90,
      desktop: 100,
    );

    double logoSize = 50;
    return GestureDetector(
      onTap: close,
      child: Container(
        color: Colors.transparent,
        child: Center(
          child: Hero(
            tag: widget.item,
            child: BubbleButton(
              width: state == Animate.open ? width : widget.initialSize,
              height: state == Animate.open ? height : widget.initialSize,
              padding: EdgeInsets.all(widget.initialPadding),
              borderRadius:
                  BorderRadius.all(Radius.circular(widget.initialBorderRadius)),
              lightShadow: const BoxShadow(
                color: Colors.black54,
                blurRadius: 20,
                spreadRadius: -10,
              ),
              child: Stack(
                children: [
                  AnimatedAlign(
                    alignment: state == Animate.open
                        ? Alignment.topLeft
                        : Alignment.center,
                    duration:
                        Duration(milliseconds: state == Animate.open ? 0 : 300),
                    child: AnimatedContainer(
                      width: state == Animate.open ? logoSize : initialLogoSize,
                      height:
                          state == Animate.open ? logoSize : initialLogoSize,
                      duration: const Duration(milliseconds: 200),
                      child: SvgPicture.asset(
                        'assets/images/about/${widget.item}.svg',
                      ),
                    ),
                  ),
                  ClipRRect(
                    child: OverflowBox(
                      maxWidth: 10000,
                      maxHeight: 10000,
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 50),
                                width: state == Animate.open
                                    ? logoSize + 20
                                    : initialLogoSize + 20,
                                height: state == Animate.open
                                    ? logoSize
                                    : initialLogoSize,
                              ),
                              Text(
                                widget.item,
                                style: theme.titleSmall,
                              ),
                            ],
                          ),
                          SizedBox(
                            key: textKey,
                            width:
                                getWidth(context) - widget.initialPadding * 2,
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Text(
                                widget.text,
                                style: theme.bodyMedium,
                              ),
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            child: SizedBox(
                              width:
                                  getWidth(context) - widget.initialPadding * 2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: getWidth(context) -
                                        (widget.initialPadding * 2) -
                                        160,
                                  ),
                                  MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: GestureDetector(
                                      onTap: close,
                                      child: Text(
                                        AppLocalizations.of(context)!.back,
                                        style: theme.bodyMedium!.copyWith(
                                          fontSize: 15,
                                          color: Colors.red[800],
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: .5,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 30),
                                  GradientTextButton(
                                    AppLocalizations.of(context)!.website,
                                    onTap: () async {
                                      final Uri url = Uri.parse(
                                        widget.doc,
                                      );
                                      if (await canLaunchUrl(url)) {
                                        await launchUrl(url);
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
