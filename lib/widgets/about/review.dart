import 'package:flutter/material.dart';
import 'package:seekode/app_themes.dart';

class Review extends StatefulWidget {
  const Review({
    super.key,
  });

  @override
  State<Review> createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  final List<ReviewData> _review = [
    ReviewData(
      author: 'Emmanuelle CUMINAL',
      text:
          'J\'ai fait appel à Nicolas pour améliorer mon site internet et il a été très efficace et professionnel. Il est réactif et donne de nombreux conseils, je recommande !',
      note: 5,
    ),
    ReviewData(
      author: 'Avenue De la Communication',
      text:
          'Excellent développeur, Nicolas fait preuve d\'un grand professionnalisme, vous pouvez lui confier toutes sortes de missions en toute confiance, il saura vous répondre à vos attentes rapidement.',
      note: 5,
    ),
    ReviewData(
      author: 'DUMAS Pascal',
      text:
          'Nicolas a toujours été d une aide rapide et efficace. Je le recommande vivement pour vos projets et suivis.',
      note: 5,
    ),
  ];

  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 999);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  Widget isExpanded(bool expand, Widget child) {
    return expand ? Expanded(child: child) : child;
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Row(
      children: [
        GestureDetector(
          onTap: () => _pageController.previousPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          ),
          child: const Icon(Icons.arrow_back_ios),
        ),
        isExpanded(
          width < 1250,
          Container(
            height: responsiveValue(context, phone: 200, tablet: 150),
            width: 500,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: PageView.builder(
              controller: _pageController,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (_, index) {
                final i = index % _review.length;

                return ReviewItem(
                  author: _review[i].author,
                  text: _review[i].text,
                  note: _review[i].note,
                );
              },
            ),
          ),
        ),
        GestureDetector(
          onTap: () => _pageController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          ),
          child: const Icon(Icons.arrow_forward_ios),
        ),
      ],
    );
  }
}

class ReviewItem extends StatelessWidget {
  const ReviewItem({
    super.key,
    required this.author,
    required this.text,
    required this.note,
  });

  final String author;
  final String text;
  final int note;

  @override
  Widget build(BuildContext context) {
    final TextTheme theme = Theme.of(context).textTheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(author, style: theme.titleSmall!.copyWith(fontSize: 18)),
        const SizedBox(height: 10),
        Text(
          text,
          style: theme.bodySmall,
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            for (int i = 0; i < 5; i++)
              Icon(
                i < note ? Icons.star_rounded : Icons.star_border_rounded,
                color: Colors.yellow[700],
              ),
          ],
        )
      ],
    );
  }
}

class ReviewData {
  ReviewData({required this.author, required this.text, required this.note});

  final String author;
  final String text;
  final int note;
}
