import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../providers/toast/toast_state.dart';

class Toast extends ConsumerStatefulWidget {
  const Toast({super.key});

  @override
  ConsumerState<Toast> createState() => _ToastState();
}

class _ToastState extends ConsumerState<Toast> {
  bool firstLoading = true;
  bool firstContainerAnimate = false;
  bool secondContainerAnimate = false;
  String? text;
  List<String> test = [];

  @override
  Widget build(BuildContext context) {
    final Brightness brightness = Theme.of(context).brightness;
    final double width = MediaQuery.of(context).size.width;

    final String? toast = ref.watch(toastStateProvider);
    if ((toast != null || firstLoading) && text == null) {
      text = firstLoading ? AppLocalizations.of(context)!.welcome : toast;

      //open
      Future.delayed(Duration(milliseconds: firstLoading ? 1500 : 0), () {
        if (firstLoading) firstLoading = false;
        setState(() => firstContainerAnimate = true);

        Future.delayed(const Duration(seconds: 1), () {
          setState(() => secondContainerAnimate = true);

          // close
          Future.delayed(const Duration(seconds: 3), () {
            setState(() => secondContainerAnimate = false);

            Future.delayed(const Duration(seconds: 1), () {
              setState(() => firstContainerAnimate = false);
              setState(() => text = null);
              ref.read(toastStateProvider.notifier).set(null);
            });
          });
        });
      });
    }

    return AnimatedPositioned(
      top: firstContainerAnimate ? 20 : -100,
      width: width,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
      child: Center(
        child: SafeArea(
          child: AnimatedContainer(
            width: secondContainerAnimate ? 300 : 50,
            height: 50,
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn,
            decoration: BoxDecoration(
              color: brightness == Brightness.light
                  ? const Color.fromARGB(160, 255, 255, 255)
                  : const Color.fromARGB(116, 41, 38, 42),
              borderRadius: const BorderRadius.all(
                Radius.circular(25),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: brightness == Brightness.light ? 20 : 10,
                  spreadRadius: brightness == Brightness.light ? 15 : 5,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(25)),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 4,
                  sigmaY: 4,
                ),
                child: OverflowBox(
                  maxWidth: 400,
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 50,
                        child: SvgPicture.asset(
                          'assets/images/logo.svg',
                          height: 30,
                        ),
                      ),
                      SizedBox(
                        width: 225,
                        child: Center(
                          child: Text(
                            text ?? '',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
