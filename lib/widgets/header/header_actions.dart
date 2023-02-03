import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../bubble_button.dart';

class HeaderActions extends StatelessWidget {
  const HeaderActions({super.key});

  Widget layout(double width, Widget child) => width > 1024
      ? Positioned(
          right: 0,
          child: child,
        )
      : Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: width * .8 + 60,
            ),
            Center(
              child: child,
            ),
          ],
        );

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double btnWidth = width * .20;

    final bool isDesktop = width > 1024;

    return layout(
      width,
      Padding(
        padding: const EdgeInsets.all(5),
        child: Flex(
          direction: isDesktop ? Axis.vertical : Axis.horizontal,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                BubbleButton(
                  width: isDesktop ? null : btnWidth,
                  height: btnWidth < 70 ? btnWidth : null,
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
                  width: isDesktop ? null : btnWidth,
                  height: btnWidth < 70 ? btnWidth : null,
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
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                BubbleButton(
                  width: isDesktop ? null : btnWidth,
                  height: btnWidth < 70 ? btnWidth : null,
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
                  width: isDesktop ? null : btnWidth,
                  height: btnWidth < 70 ? btnWidth : null,
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
        ),
      ),
    );
  }
}
