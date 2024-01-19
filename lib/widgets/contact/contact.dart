import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../app_themes.dart';
import '../bubble_button.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme theme = Theme.of(context).textTheme;
    final double width = MediaQuery.of(context).size.width;

    final double qrcodeSize = responsiveValue(
      context,
      phone: width * 0.7,
      tablet: width * 0.45,
      desktop: width * 0.4,
      bigger: {
        1200: 480,
      },
    );

    final double networkSize = responsiveValue(
      context,
      phone: 60,
      tablet: qrcodeSize / 5,
    );

    return Flex(
      direction: width > 600 ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            if (width > 600)
              Row(
                children: [
                  BubbleButton(
                    width: networkSize * 2,
                    height: 60,
                    margin: const EdgeInsets.all(5),
                    onTap: () async {
                      final Uri url = Uri.parse(
                        'https://play.google.com/store/apps/details?id=com.seekode.seekode',
                      );
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      }
                    },
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/images/networks/playstore.svg',
                        height: 30,
                      ),
                    ),
                  ),
                  BubbleButton(
                    width: networkSize * 2,
                    height: 60,
                    margin: const EdgeInsets.all(5),
                    onTap: () async {
                      final Uri url =
                          Uri.parse('https://links.seekode.dev/seekode.exe');
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      }
                    },
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/images/networks/windows.svg',
                        width: 30,
                      ),
                    ),
                  ),
                ],
              ),
            if (width > 600)
              const SizedBox(
                height: 10,
              ),
            SizedBox(
              width: qrcodeSize,
              height: qrcodeSize,
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/networks/qrcode.png',
                    width: double.infinity,
                  ),
                  Positioned(
                    bottom: 0,
                    width: qrcodeSize,
                    child: SizedBox(
                      height: qrcodeSize * 0.176,
                      child: Center(
                        child: Text(
                          'seekode',
                          style: theme.titleLarge!.copyWith(
                            fontSize: qrcodeSize * 0.1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            if (width <= 600)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BubbleButton(
                    width: (width * .7) / 2 - 25,
                    height: 60,
                    margin: const EdgeInsets.all(5),
                    onTap: () async {
                      final Uri url = Uri.parse(
                        'https://play.google.com/store/apps/details?id=com.seekode.seekode',
                      );
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      }
                    },
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/images/networks/playstore.svg',
                        height: 30,
                      ),
                    ),
                  ),
                  BubbleButton(
                    width: (width * .7) / 2 - 25,
                    height: 60,
                    margin: const EdgeInsets.all(5),
                    onTap: () async {
                      final Uri url =
                          Uri.parse('https://links.seekode.dev/seekode.exe');
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      }
                    },
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/images/networks/windows.svg',
                        width: 30,
                      ),
                    ),
                  ),
                ],
              ),
            if (width > 600)
              Row(
                children: [
                  BubbleButton(
                    width: networkSize * 2 + 10,
                    height: 60,
                    margin: const EdgeInsets.all(5),
                    onTap: () async {
                      final Uri url = Uri.parse('tel:+33621240684');
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      }
                    },
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/images/networks/phone.svg',
                        width: 30,
                      ),
                    ),
                  ),
                  BubbleButton(
                    width: networkSize * 2 + 10,
                    height: 60,
                    margin: const EdgeInsets.all(5),
                    onTap: () async {
                      final Uri url =
                          Uri.parse('mailto:nicolas18.ew@gmail.com');
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      }
                    },
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/images/networks/mail.svg',
                        width: 30,
                      ),
                    ),
                  ),
                ],
              ),
            if (width > 600)
              Row(
                children: [
                  BubbleButton(
                    width: networkSize,
                    height: 60,
                    margin: const EdgeInsets.all(5),
                    onTap: () async {
                      final Uri url =
                          Uri.parse('https://www.instagram.com/seekodes');
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      }
                    },
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/images/networks/instagram.svg',
                        width: 40,
                      ),
                    ),
                  ),
                  BubbleButton(
                    width: networkSize,
                    height: 60,
                    margin: const EdgeInsets.all(5),
                    onTap: () async {
                      final Uri url =
                          Uri.parse('https://www.tiktok.com/@seekode');
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      }
                    },
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/images/networks/tiktok.svg',
                        width: 30,
                      ),
                    ),
                  ),
                  BubbleButton(
                    width: networkSize,
                    height: 60,
                    margin: const EdgeInsets.all(5),
                    onTap: () async {
                      final Uri url = Uri.parse(
                        'https://www.linkedin.com/in/nicolas-texier-dev/',
                      );
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      }
                    },
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/images/networks/linkedin.svg',
                        width: 30,
                      ),
                    ),
                  ),
                  BubbleButton(
                    width: networkSize,
                    height: 60,
                    margin: const EdgeInsets.all(5),
                    onTap: () async {
                      final Uri url =
                          Uri.parse('https://youtube.com/@_seekode');
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      }
                    },
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/images/trainings/youtube.svg',
                        width: 30,
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
        SizedBox(
          height: 80,
          width: responsiveValue(
            context,
            phone: 50,
            desktop: 200,
            large: 400,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: responsiveValue(
                context,
                phone: width * 0.4,
                tablet: width * 0.35,
              ),
              constraints: const BoxConstraints(maxWidth: 420),
              child: Image.asset('assets/images/networks/phone.png'),
            ),
            if (width < 601) const SizedBox(width: 20),
            if (width < 601)
              Column(
                children: [
                  BubbleButton(
                    width: networkSize,
                    height: networkSize,
                    margin: const EdgeInsets.all(5),
                    onTap: () async {
                      final Uri url =
                          Uri.parse('https://www.instagram.com/seekodes');
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      }
                    },
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/images/networks/instagram.svg',
                        width: 40,
                      ),
                    ),
                  ),
                  BubbleButton(
                    width: networkSize,
                    height: networkSize,
                    margin: const EdgeInsets.all(5),
                    onTap: () async {
                      final Uri url =
                          Uri.parse('https://www.tiktok.com/@seekode');
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      }
                    },
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/images/networks/tiktok.svg',
                        width: 30,
                      ),
                    ),
                  ),
                  BubbleButton(
                    width: networkSize,
                    height: networkSize,
                    margin: const EdgeInsets.all(5),
                    onTap: () async {
                      final Uri url = Uri.parse(
                          'https://www.linkedin.com/in/nicolas-texier-dev/');
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      }
                    },
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/images/networks/linkedin.svg',
                        width: 30,
                      ),
                    ),
                  ),
                  BubbleButton(
                    width: networkSize,
                    height: networkSize,
                    margin: const EdgeInsets.all(5),
                    onTap: () async {
                      final Uri url =
                          Uri.parse('https://youtube.com/@_seekode');
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      }
                    },
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/images/trainings/youtube.svg',
                        width: 30,
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
        if (width <= 600)
          const SizedBox(
            height: 30,
          ),
        if (width <= 600)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BubbleButton(
                width: width * .5 - 30,
                height: 60,
                margin: const EdgeInsets.all(5),
                onTap: () async {
                  final Uri url = Uri.parse('tel:+33621240684');
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  }
                },
                child: Center(
                  child: SvgPicture.asset(
                    'assets/images/networks/phone.svg',
                    width: 30,
                  ),
                ),
              ),
              BubbleButton(
                width: width * .5 - 30,
                height: 60,
                margin: const EdgeInsets.all(5),
                onTap: () async {
                  final Uri url = Uri.parse('mailto:nicolas18.ew@gmail.com');
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  }
                },
                child: Center(
                  child: SvgPicture.asset(
                    'assets/images/networks/mail.svg',
                    width: 30,
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }
}
