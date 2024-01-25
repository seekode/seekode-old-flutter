import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:seekode/widgets/projects/project_item.dart';

import '../../app_themes.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    final List<Map<String, dynamic>> items = [
      {
        'title': 'Seekode',
        'subtitle': AppLocalizations.of(context)!.expSubtitleSeekode,
        'img': 'seekode.png',
        'description': AppLocalizations.of(context)!.expDescriptionSeekode,
        'tech': const [
          'Flutter',
          'Dart',
          'Responsive',
          'Figma',
          'Git',
          'GitHub',
          'FileZilla',
          'Android Studio',
        ],
      },
      {
        'title': 'Formawave',
        'subtitle': AppLocalizations.of(context)!.expSubtitleFormawave,
        'img': 'formawave.png',
        'description': AppLocalizations.of(context)!.expDescriptionFormawave,
        'tech': const [
          'Flutter',
          'Dart',
          'HTML',
          'CSS',
          'JavaScript',
          'PHP',
          'MySQL',
          'Firebase',
          'Responsive',
          'Figma',
          'Git',
          'GitHub',
          'Trello',
          'FileZilla',
        ],
      },
      {
        'title': 'Capters',
        'subtitle': AppLocalizations.of(context)!.expSubtitleCapters,
        'img': 'capters.png',
        'description': AppLocalizations.of(context)!.expDescriptionCapters,
        'tech': const [
          'React Native',
          'CSS',
          'Firebase',
          'Git',
          'GitHub',
        ],
      },
      {
        'title': 'Capters admin',
        'subtitle': AppLocalizations.of(context)!.expSubtitleCaptersAdmin,
        'img': 'capters.png',
        'description':
            AppLocalizations.of(context)!.expDescriptionSCaptersAdmin,
        'tech': const [
          'HTML',
          'CSS',
          'JavaScript',
          'Bootstrap',
          'Firebase',
          'Git',
          'GitHub',
        ],
      },
      {
        'title': 'ec-controlling',
        'subtitle': AppLocalizations.of(context)!.expSubtitleControlling,
        'img': 'ec-controlling.png',
        'description': AppLocalizations.of(context)!.expDescriptionControlling,
        'tech': const ['WordPress', 'Figma'],
      },
      {
        'title': 'Tennis vexin-thelle',
        'subtitle': AppLocalizations.of(context)!.expSubtitleTennisVexinThelle,
        'img': 'tennisvexin-thelle.png',
        'description':
            AppLocalizations.of(context)!.expDescriptionTennisVexinThelle,
        'tech': const [
          'HTML',
          'CSS',
          'JavaScript',
          'Figma',
          'PHP',
          'MySQL',
          'Git',
          'GitHub',
        ],
      },
      {
        'title': 'Desmarez',
        'subtitle': AppLocalizations.of(context)!.expSubtitleDesmarez,
        'img': 'desmarez.png',
        'description': AppLocalizations.of(context)!.expDescriptionDesmarez,
        'tech': const ['C++', 'Java', 'XML'],
      },
      {
        'title': 'Sophrologie',
        'subtitle': AppLocalizations.of(context)!.expSubtitleSophrologie,
        'img': 'sophrologue.png',
        'description': AppLocalizations.of(context)!.expDescriptionSophrologie,
        'tech': const [
          'HTML',
          'CSS',
          'JavaScript',
          'Figma',
          'Git',
          'GitHub',
        ],
      },
    ];

    return SizedBox(
      width: responsiveValue(
        context,
        phone: width * .9,
        large: 1500,
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              AppLocalizations.of(context)!.myProjects,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          SizedBox(
            height: responsiveValue(
              context,
              phone: 10,
              tablet: 20,
              desktop: 40,
            ),
          ),
          Wrap(
            alignment: WrapAlignment.center,
            children: items
                .map(
                  (item) => MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: ProjectItem(
                      title: item['title'],
                      subtitle: item['subtitle'],
                      img: item['img'],
                      description: item['description'],
                      tech: item['tech'],
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
