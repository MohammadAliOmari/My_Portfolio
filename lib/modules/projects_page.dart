import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:portfolio1_project/shared/components/project_card.dart';

import '../shared/components/title_card.dart';
import '../shared/constants/color_manager.dart';
import '../shared/constants/values.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({super.key});
  @override
  Widget build(BuildContext context) {
    // ScrollController controllers = ScrollController();
    final List<String> texts = [
      'Graduation project management system',
      'Bookly App',
      'Shop App',
      'News App',
      'Weather App',
      'QUIZ App',
      'Todo List',
      'Bmi Calculator',
    ];
    // final List<AssetImage> images = [
    //   const AssetImage('assets/images/project_manager.jpg'),
    //   const AssetImage('assets/images/project_manager.jpg'),
    //   const AssetImage('assets/images/news_app.jpg'),
    //   const AssetImage('assets/images/Weather App.jpg'),
    //   const AssetImage('assets/images/quiz_app.jpg'),
    //   const AssetImage('assets/images/todo_lists.jpg'),
    //   const AssetImage('assets/images/bmi_calc.jpg'),
    // ];
    final List img = [
      [
        'assets/images/admin1.jpg',
        'assets/images/admin2.jpg',
        'assets/images/admin3.jpg',
        'assets/images/student.jpg',
        'assets/images/doctor.jpg',
      ],
      [
        'assets/images/splash_screen.jpg',
        'assets/images/home_screen.jpg',
      ],
      [
        'assets/images/onboarding.jpg',
        'assets/images/home_page.jpg',
        'assets/images/categories.jpg',
        'assets/images/search_profile.jpg',
      ],
      [
        'assets/images/news_light.jpg',
        'assets/images/news_dark.jpg',
      ],
      [
        'assets/images/Weather App.jpg',
      ],
      [
        'assets/images/quiz_app.jpg',
      ],
      [
        'assets/images/todo_lists.jpg',
      ],
      [
        'assets/images/bmi_calc.jpg',
      ]
    ];
    final double width = MediaQuery.of(context).size.width;
    final bool isWeb = width > 650;
    // void scrollToPrevious() {
    //   controllers.animateTo(
    //     controllers.offset - (width + 20),
    //     duration: const Duration(milliseconds: 500),
    //     curve: Curves.easeInOut,
    //   );
    // }

    // void scrollToNext() {
    //   controllers.animateTo(
    //     controllers.offset + (width + 20),
    //     duration: const Duration(milliseconds: 500),
    //     curve: Curves.easeInOut,
    //   );
    // }

    return SizedBox(
      height: 3600,
      child: Scaffold(
          backgroundColor: ColorsManager.grey.withOpacity(0),
          body: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BounceInDown(
                  duration: const Duration(milliseconds: 1500),
                  child: const Center(
                    child: TitleCard(text: AppString.projects),
                  ),
                ),
                const SizedBox(
                  height: Distance.d50,
                ),
                Expanded(
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runSpacing: Distance.d20,
                    spacing: Distance.d20,
                    children: [
                      ProjectCard(index1: 0, text: texts[0], image: img),
                      ProjectCard(index1: 1, text: texts[1], image: img),
                      ProjectCard(index1: 2, text: texts[2], image: img),
                      ProjectCard(index1: 3, text: texts[3], image: img),
                      ProjectCard(index1: 4, text: texts[4], image: img),
                      ProjectCard(index1: 5, text: texts[5], image: img),
                      ProjectCard(index1: 6, text: texts[6], image: img),
                      ProjectCard(index1: 7, text: texts[7], image: img),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
