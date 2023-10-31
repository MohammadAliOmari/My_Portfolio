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
    final List<String> texts = [
      'Graduation project management system',
      'QUIZ App',
      'Weather App',
      'Todo List',
      'Bmi Calculator',
    ];
    final List<AssetImage> images = [
      const AssetImage('assets/images/project_manager.jpg'),
      const AssetImage('assets/images/quiz_app.jpg'),
      const AssetImage('assets/images/Weather App.jpg'),
      const AssetImage('assets/images/todo_lists.jpg'),
      const AssetImage('assets/images/bmi_calc.jpg'),
    ];
    final double width = MediaQuery.of(context).size.width;
    final bool isWeb = width > 640;
    return SizedBox(
      height: 2500,
      child: Scaffold(
          backgroundColor: ColorsManager.grey.withOpacity(0),
          body: Padding(
            padding: EdgeInsets.all(isWeb ? Distance.d40 : 10),
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
                      ProjectCard(index: 0, text: texts[0], image: images[0]),
                      ProjectCard(index: 1, text: texts[1], image: images[1]),
                      ProjectCard(index: 2, text: texts[2], image: images[2]),
                      ProjectCard(index: 3, text: texts[3], image: images[3]),
                      ProjectCard(index: 4, text: texts[4], image: images[4]),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
