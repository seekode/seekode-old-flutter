import 'package:flutter/material.dart';

import '../bubble.dart';

class BenefitItem extends StatelessWidget {
  const BenefitItem({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    this.reverse,
  });

  final String title;
  final String description;
  final String image;
  final bool? reverse;

  Widget _image(String image) {
    return Padding(
      padding: EdgeInsets.only(
        left: reverse == true ? 5 : 15,
        right: reverse == true ? 15 : 5,
      ),
      child: SizedBox(
        width: 60,
        height: 60,
        child: Image.asset(
          'assets/images/services/$image.png',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Bubble(
      height: 100,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: EdgeInsets.only(
          left: reverse == true ? 10 : 23,
          right: reverse == true ? 23 : 10,
        ),
        child: Row(
          children: [
            if (reverse == true) _image(image),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontSize: 12.5),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (reverse != true) _image(image),
          ],
        ),
      ),
    );
  }
}
