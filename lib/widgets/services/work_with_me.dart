import 'package:flutter/material.dart';
import 'package:seekode/app_themes.dart';
import 'package:seekode/widgets/services/benefit_item.dart';

class WorkWithMe extends StatelessWidget {
  WorkWithMe({super.key});

  final List<Map<String, String>> _itemLeft = [
    {
      'title': 'Une application qui s\'adapte !',
      'description': 'ascascascascsascascas ascasdsa asdasd asd asd asd',
      'img': 'responsive',
    },
    {
      'title': 'Un design cohérent !',
      'description': 'ascascascascsascascas ascasdsa asdasd asd asd asd',
      'img': 'design',
    },
    {
      'title': 'Un travail serieux et de qualité !',
      'description': 'ascascascascsascascas ascasdsa asdasd asd asd asd',
      'img': 'coding',
    },
  ];

  final List<Map<String, String>> _itemRight = [
    {
      'title': 'Des conseils avisées !',
      'description': 'ascascascascsascascas ascasdsa asdasd asd asd asd',
      'img': 'tips',
    },
    {
      'title': 'Etre satisfait du résultat !',
      'description': 'ascascascascsascascas ascasdsa asdasd asd asd asd',
      'img': 'support',
    },
    {
      'title': 'Une satisfaction garantie !',
      'description': 'ascascascascsascascas ascasdsa asdasd asd asd asd',
      'img': 'handshake',
    },
  ];

  Widget _expanded(screeWidth, {required Widget child}) =>
      screeWidth > 1024 ? Expanded(child: child) : child;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Row(
      children: [
        if (width > 700 && width <= 1024)
          Padding(
            padding: const EdgeInsets.all(20),
            child: Image.asset(
              'assets/images/services.png',
              width: responsiveValue(
                context,
                phone: 300,
                desktop: 300,
              ),
            ),
          ),
        Expanded(
          child: Flex(
            direction: width > 1024 ? Axis.horizontal : Axis.vertical,
            children: [
              _expanded(
                width,
                child: Column(
                  children: [
                    for (final item in _itemLeft)
                      BenefitItem(
                        title: item['title']!,
                        description: item['description']!,
                        image: item['img']!,
                      ),
                  ],
                ),
              ),
              if (width <= 700 || width > 1024)
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Image.asset(
                    'assets/images/services.png',
                    width: responsiveValue(
                      context,
                      phone: 250,
                      tablet: 380,
                      desktop: 300,
                    ),
                  ),
                ),
              _expanded(
                width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    for (final item in _itemRight)
                      BenefitItem(
                        title: item['title']!,
                        description: item['description']!,
                        image: item['img']!,
                        reverse: true,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
