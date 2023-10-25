import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:portfolio1_project/shared/constants/values.dart';

import '../shared/components/skill_card.dart';
import '../shared/components/title_card.dart';
import '../shared/constants/color_manager.dart';

class SkillPage extends StatelessWidget {
  const SkillPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final bool isWeb = width > 640;
    return SizedBox(
      height: 1000,
      child: Scaffold(
        backgroundColor: ColorsManager.grey.withOpacity(0),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: Distance.d40),
          child: Column(
            crossAxisAlignment:
                isWeb ? CrossAxisAlignment.center : CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BounceInDown(
                duration: const Duration(milliseconds: 1500),
                child: const Center(
                  child: TitleCard(text: AppString.skills),
                ),
              ),
              const SizedBox(
                height: Distance.d80,
              ),
              Expanded(
                child: FadeInLeft(
                  duration: const Duration(milliseconds: 1500),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.start,
                    alignment: WrapAlignment.start,
                    spacing: Distance.d10,
                    runSpacing: Distance.d40,
                    children: [
                      HoverSkillCardItem(
                        skillName: 'Flutter',
                        context: context,
                        img: const AssetImage(
                            'assets/images/icons8-flutter-100.png'),
                      ),
                      HoverSkillCardItem(
                        skillName: 'PHP',
                        context: context,
                        img: const AssetImage(
                            'assets/images/icons8-php-100.png'),
                      ),
                      HoverSkillCardItem(
                        skillName: 'MYSQL',
                        context: context,
                        img: const AssetImage(
                            'assets/images/icons8-mysql-100.png'),
                      ),
                      HoverSkillCardItem(
                        skillName: 'Dart',
                        context: context,
                        img: const AssetImage(
                            'assets/images/icons8-dart-100.png'),
                      ),
                      HoverSkillCardItem(
                        skillName: 'Api',
                        context: context,
                        img:
                            const AssetImage('assets/images/icons8-api-67.png'),
                      ),
                      HoverSkillCardItem(
                        skillName: 'Postman',
                        context: context,
                        img: const AssetImage(
                            'assets/images/icons8-postman-api-128.png'),
                      ),
                      HoverSkillCardItem(
                        skillName: 'Git&GitHub',
                        context: context,
                        img: const AssetImage(
                            'assets/images/icons8-github-100.png'),
                      ),
                      HoverSkillCardItem(
                        skillName: 'VsCode',
                        context: context,
                        img: const AssetImage(
                            'assets/images/icons8-visual-studio-100.png'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
