import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app_themes.dart';
import '../bubble.dart';

class ProjectItem extends ConsumerWidget {
  const ProjectItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.img,
    required this.description,
    this.tech,
  });

  final String title;
  final String subtitle;
  final String img;
  final String description;
  final List<String>? tech;

  void displayProject(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final Brightness brightness = Theme.of(context).brightness;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      constraints: const BoxConstraints(
        minWidth: double.infinity,
      ),
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
      elevation: 0,
      builder: (context) => Container(
        padding: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          // color: Colors.red,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(23),
            topRight: Radius.circular(23),
          ),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(12, 0, 0, 0),
              blurRadius: brightness == Brightness.light ? 10 : 0,
              spreadRadius: brightness == Brightness.light ? 10 : 0,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(23),
            topRight: Radius.circular(23),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              width: double.infinity,
              height: height * .8,
              color: brightness == Brightness.light
                  ? const Color.fromARGB(100, 255, 255, 255)
                  : const Color.fromARGB(116, 41, 38, 42),
              child: Consumer(
                builder: (context, ref, _) => ProjectContent(
                  title: title,
                  subtitle: subtitle,
                  img: img,
                  description: description,
                  tech: tech,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = Theme.of(context);

    final double width = responsiveValue(
      context,
      phone: 150,
      tablet: 200,
      desktop: 250,
      large: 300,
    );

    return GestureDetector(
      onTap: () => displayProject(context),
      child: Bubble(
        width: width,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              width: width,
              height: width * 0.8,
              decoration: BoxDecoration(
                color: theme.primaryColor,
                borderRadius: const BorderRadius.all(Radius.circular(23)),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(23)),
                child: Image.asset(
                  'assets/images/projects/$img',
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      title,
                      style: theme.textTheme.titleSmall!.copyWith(fontSize: 15),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      subtitle,
                      style: theme.textTheme.bodySmall!.copyWith(fontSize: 10),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectContent extends StatefulWidget {
  const ProjectContent({
    super.key,
    required this.title,
    required this.subtitle,
    required this.img,
    required this.description,
    this.tech,
  });

  final String title;
  final String subtitle;
  final String img;
  final String description;
  final List<String>? tech;

  @override
  State<ProjectContent> createState() => _ProjectContentState();
}

class _ProjectContentState extends State<ProjectContent> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    bool close = true;

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollEndNotification) {
          close = _scrollController.offset == 0;
        }

        if (notification is ScrollUpdateNotification &&
            notification.scrollDelta! > 0) {
          close = false;
        }

        if (notification is OverscrollNotification &&
            notification.overscroll <= 0 &&
            close) {
          Navigator.of(context).pop();
        }
        return true;
      },
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            Stack(
              children: [
                const SizedBox(
                  width: double.infinity,
                ),
                Center(
                  child: Bubble(
                    width: width - 80,
                    height: (width - 80) / (16 / 9),
                    constraints:
                        const BoxConstraints(maxWidth: 1200, maxHeight: 650),
                    margin: const EdgeInsets.symmetric(vertical: 40),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(23)),
                      child: Image.asset(
                        'assets/images/projects/${widget.img}',
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  right: 30,
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(13)),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(13)),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(.3),
                                  Theme.of(context)
                                      .colorScheme
                                      .secondary
                                      .withOpacity(.3),
                                ],
                              ),
                            ),
                            child: const Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              constraints: const BoxConstraints(maxWidth: 1200),
              width: width - 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.title,
                      style: Theme.of(context).textTheme.titleSmall),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(widget.subtitle,
                        style: Theme.of(context).textTheme.labelLarge),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(widget.description),
                  ),
                  if (widget.tech != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 60),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: widget.tech!
                            .map(
                              (item) => Bubble(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                margin: const EdgeInsets.all(5),
                                customColor:
                                    Theme.of(context).colorScheme.primary,
                                secondeCustomColor:
                                    Theme.of(context).colorScheme.secondary,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                child: Text(
                                  item,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
