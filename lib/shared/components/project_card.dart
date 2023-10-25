import 'package:flutter/material.dart';
import 'package:portfolio1_project/shared/components/project_button.dart';
import 'package:portfolio1_project/shared/constants/values.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/color_manager.dart';

class ProjectCard extends StatelessWidget {
  final String text;
  final AssetImage image;

  final int index;
  const ProjectCard({
    super.key,
    required this.index,
    required this.text,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    List<Uri> urlList = [
      Uri.parse('https://github.com/MohammadAliOmari/project-manager'),
      Uri.parse('https://github.com/MohammadAliOmari/Quiz_App'),
      Uri.parse('https://github.com/MohammadAliOmari/TodoList'),
      Uri.parse('https://github.com/MohammadAliOmari/bmi_calculator'),
    ];
    List<Uri> demoList = [
      Uri.parse('https://github.com/MohammadAliOmari/project-manager'),
      Uri.parse('https://moquizapp.netlify.app/'),
      Uri.parse('https://mohamadtodolist.netlify.app'),
      Uri.parse('https://bmiclac.netlify.app'),
    ];
    Future launchUrl1() async {
      if (!await launchUrl(urlList[index])) {
        throw Exception('Could not launch $urlList');
      }
    }

    Future launchUrl2() async {
      if (index == 0) {
        return null;
      } else if (!await launchUrl(demoList[index])) {
        throw Exception('Could not launch $demoList');
      }
    }

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: ColorsManager.darkblue, width: 2),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        color: ColorsManager.cardcolor,
      ),
      width: width > 700 ? width / 3 : width,
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        SizedBox(
          width: width > 700 ? width / 3 : width,
          child: Image(
            image: image,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: Distance.d10,
        ),
        Text(
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          text,
          style: const TextStyle(color: ColorsManager.white, fontSize: 25),
        ),
        const SizedBox(
          height: Distance.d50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProjectButton(
              launchUrl: launchUrl1,
              text: 'Code',
              icon: Icons.code_outlined,
            ),
            const SizedBox(
              width: Distance.d20,
            ),
            index == 0
                ? const SizedBox.shrink()
                : ProjectButton(
                    launchUrl: index == 0 ? null : launchUrl2,
                    text: 'Demo',
                    icon: Icons.arrow_outward_rounded)
          ],
        ),
        const SizedBox(
          height: Distance.d20,
        ),
      ]),
    );
  }
}
