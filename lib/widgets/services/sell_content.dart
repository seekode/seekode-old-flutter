import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:seekode/widgets/bubble_button.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../providers/toast/toast_state.dart';

class SellContent extends StatefulWidget {
  const SellContent(this._activeItem, {super.key});

  final int _activeItem;

  @override
  State<SellContent> createState() => _SellContentState();
}

class _SellContentState extends State<SellContent>
    with TickerProviderStateMixin {
  late final _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 300),
  );

  late final Animation<double> _animation = Tween(
    begin: 0.0,
    end: 1.0,
  ).animate(_controller);

  late int currentItem = widget._activeItem;

  @override
  void initState() {
    _controller.addStatusListener((status) {
      if (_controller.status == AnimationStatus.dismissed) {
        setState(() {
          currentItem = widget._activeItem;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Brightness brightness = Theme.of(context).brightness;

    if (widget._activeItem != currentItem) {
      if (_controller.status == AnimationStatus.dismissed) {
        setState(() {
          currentItem = widget._activeItem;
        });
      } else {
        _controller.reverse();
      }
    } else {
      _controller.forward();
    }

    return Stack(
      children: [
        Positioned.fill(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: SvgPicture.asset(
                'assets/images/logo-text.svg',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ),
        Container(
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
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: Container(
                width: double.infinity,
                color: brightness == Brightness.light
                    ? const Color.fromARGB(190, 255, 255, 255)
                    : const Color.fromARGB(116, 41, 38, 42),
                child: AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: FadeTransition(
                      opacity: _animation,
                      child: SellContentItem(currentItem),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

enum ContentType {
  title,
  text,
  list,
  actions,
  space,
}

class SellContentItem extends ConsumerWidget {
  const SellContentItem(this._index, {super.key});

  final int _index;

  Widget displayTitle(String content, ThemeData theme) => Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Text(
          content,
          style: theme.textTheme.titleSmall,
        ),
      );

  Widget displayList(List<String> content) => Padding(
        padding: const EdgeInsets.only(left: 20, bottom: 10),
        child: Column(
          children: content
              .map((e) => Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('• '),
                      Flexible(child: Text(e)),
                    ],
                  ))
              .toList(),
        ),
      );

  Widget displayActions(List content, WidgetRef ref, BuildContext context,
          ThemeData theme, double width) =>
      Row(
        children: content
            .map(
              (e) => BubbleButton.notDefaultSquare(
                onTap: () async {
                  final String link = e['link'];
                  if (link.isNotEmpty) {
                    final Uri url = Uri.parse(link);
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    }
                  } else {
                    ref
                        .read(toastStateProvider.notifier)
                        .set(AppLocalizations.of(context)!.featureInDev);
                  }
                },
                margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                lightShadow: const BoxShadow(
                  color: Colors.black54,
                  blurRadius: 50,
                  spreadRadius: -7,
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      e['logo'],
                      height: 20,
                    ),
                    const SizedBox(width: 5),
                    if (width >= 380)
                      Text(
                        e['text'],
                        style: theme.textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  ],
                ),
              ),
            )
            .toList(),
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = Theme.of(context);

    final List<List<Map<String, dynamic>>> items = [
      [
        {
          'type': ContentType.title,
          'content': AppLocalizations.of(context)!.sellContentCoaching1,
        },
        {
          'type': ContentType.text,
          'content': AppLocalizations.of(context)!.sellContentCoaching2,
        },
        {
          'type': ContentType.actions,
          'content': [
            {
              'text': 'YouTube',
              'logo': 'assets/images/trainings/youtube.svg',
              'link': 'https://youtube.com/@_seekode',
            },
            {
              'text': 'Udemy',
              'logo': 'assets/images/trainings/udemy.svg',
              'link': 'https://www.udemy.com/fr/',
            },
          ]
        },
        {'type': ContentType.space},
        {
          'type': ContentType.title,
          'content': AppLocalizations.of(context)!.sellContentCoaching3,
        },
        {
          'type': ContentType.text,
          'content': AppLocalizations.of(context)!.sellContentCoaching4,
        },
        {
          'type': ContentType.list,
          'content': [
            AppLocalizations.of(context)!.sellContentCoaching5,
            AppLocalizations.of(context)!.sellContentCoaching7,
            AppLocalizations.of(context)!.sellContentCoaching10,
          ],
        },
        {
          'type': ContentType.actions,
          'content': [
            {
              'text': 'email',
              'logo': 'assets/images/networks/mail.svg',
              'link': 'mailto:nicolas18.ew@gmail.com',
            },
            {
              'text': 'call',
              'logo': 'assets/images/networks/phone.svg',
              'link': 'tel:+33621240684',
            },
            {
              'text': 'discord',
              'logo': 'assets/images/trainings/discord.svg',
              'link': 'https://discord.gg/g494as8mxM',
            },
          ]
        },
        {'type': ContentType.space},
        {
          'type': ContentType.title,
          'content': AppLocalizations.of(context)!.sellContentCoaching11,
        },
        {
          'type': ContentType.text,
          'content': AppLocalizations.of(context)!.sellContentCoaching12,
        },
        {
          'type': ContentType.list,
          'content': [
            AppLocalizations.of(context)!.sellContentCoaching13,
            AppLocalizations.of(context)!.sellContentCoaching14,
          ],
        },
        {
          'type': ContentType.actions,
          'content': [
            {
              'text': 'email',
              'logo': 'assets/images/networks/mail.svg',
              'link': 'mailto:nicolas18.ew@gmail.com',
            },
            {
              'text': 'call',
              'logo': 'assets/images/networks/phone.svg',
              'link': 'tel:+33621240684',
            },
            {
              'text': 'discord',
              'logo': 'assets/images/trainings/discord.svg',
              'link': 'https://discord.gg/g494as8mxM',
            },
          ]
        },
      ],
      [
        {
          'type': ContentType.title,
          'content': AppLocalizations.of(context)!.sellContentProject1,
        },
        {
          'type': ContentType.text,
          'content': AppLocalizations.of(context)!.sellContentProject2,
        },
        {
          'type': ContentType.text,
          'content': AppLocalizations.of(context)!.sellContentProject3,
        },
        {
          'type': ContentType.title,
          'content': AppLocalizations.of(context)!.sellContentProject5,
        },
        {
          'type': ContentType.text,
          'content': AppLocalizations.of(context)!.sellContentProject6,
        },
        {
          'type': ContentType.text,
          'content': AppLocalizations.of(context)!.sellContentProject4,
        },
        {
          'type': ContentType.actions,
          'content': [
            {
              'text': 'email',
              'logo': 'assets/images/networks/mail.svg',
              'link': 'mailto:nicolas18.ew@gmail.com',
            },
            {
              'text': 'call',
              'logo': 'assets/images/networks/phone.svg',
              'link': 'tel:+33621240684',
            },
          ]
        },
      ],
      [
        {'type': ContentType.title, 'content': 'Freelance'},
        {
          'type': ContentType.text,
          'content': AppLocalizations.of(context)!.sellContentFreelance1,
        },
        {
          'type': ContentType.text,
          'content': AppLocalizations.of(context)!.sellContentFreelance2,
        },
        {
          'type': ContentType.list,
          'content': [
            '🌐 HTML / CSS',
            '🌐📱 JavaScript',
            '🌐💻📱 Flutter',
            '🗄️ Php',
            '🗄️ MySQL',
            '🗄️ Firebase',
          ],
        },
        {
          'type': ContentType.text,
          'content': AppLocalizations.of(context)!.sellContentFreelance3,
        },
      ]
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items[_index].map((e) {
        final ContentType type = e['type'] as ContentType;

        switch (e['type'] as ContentType) {
          case ContentType.title:
            return displayTitle(e['content'], theme);
          case ContentType.text:
            return Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 10),
              child: Text(e['content']),
            );
          case ContentType.actions:
            return displayActions(e['content'], ref, context, theme,
                MediaQuery.of(context).size.width);
          case ContentType.space:
            return const SizedBox(height: 10);
          case ContentType.list:
            return displayList(e['content']);
          default:
            return const Text('error');
        }
      }).toList(),
    );
  }
}
