import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio1_project/shared/components/project_button.dart';
import 'package:portfolio1_project/shared/constants/values.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/color_manager.dart';

class ProjectCard extends StatefulWidget {
  final String text;
  final List image;

  final int index1;
  const ProjectCard({
    super.key,
    required this.index1,
    required this.text,
    required this.image,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

int activeindex = 0;

class _ProjectCardState extends State<ProjectCard> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    List<Uri> codeUrlList = [
      Uri.parse(
          'https://github.com/MohammadAliOmari/Graduation-project-management-system'),
      Uri.parse('https://github.com/MohammadAliOmari/Shop_App'),
      Uri.parse('https://github.com/MohammadAliOmari/News-App'),
      Uri.parse('https://github.com/MohammadAliOmari/Weather-App'),
      Uri.parse('https://github.com/MohammadAliOmari/Quiz_App'),
      Uri.parse('https://github.com/MohammadAliOmari/TodoList'),
      Uri.parse('https://github.com/MohammadAliOmari/bmi_calculator'),
    ];
    List<Uri> demoList = [
      Uri.parse(''),
      Uri.parse(''),
      Uri.parse(''),
      Uri.parse('https://moh-weatherapp.netlify.app'),
      Uri.parse('https://moquizapp.netlify.app/'),
      Uri.parse('https://mohamadtodolist.netlify.app'),
      Uri.parse('https://bmiclac.netlify.app'),
    ];
    Future launchUrl1() async {
      if (!await launchUrl(codeUrlList[widget.index1])) {
        throw Exception('Could not launch $codeUrlList');
      }
    }

    Future launchUrl2() async {
      if (!await launchUrl(demoList[widget.index1])) {
        throw Exception('Could not launch $demoList');
      }
    }

    final bool isWeb = width > 600;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: const BoxDecoration(
            // border: Border.all(color: ColorsManager.darkblue, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(30)),
            color: ColorsManager.cardcolor,
          ),
          width: isWeb ? width / 2.5 : width,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            CarouselSlider.builder(
                itemCount: widget.image[widget.index1].length,
                itemBuilder: (context, index, realIndex) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                            image:
                                AssetImage(widget.image[widget.index1][index]),
                            fit: BoxFit.cover),
                      ),
                      height: 500,
                      width: isWeb ? width / 2.5 : width,
                      // child: Image(
                      //   image: AssetImage(widget.image[widget.index1][index]),
                      //   fit: BoxFit.cover,
                      // ),
                    ),
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    setState(() {
                      activeindex = index;
                    });
                  },
                  initialPage: 0,
                  enableInfiniteScroll: false,
                  reverse: false,
                  autoPlay: false,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  scrollDirection: Axis.horizontal,
                  viewportFraction: 1,
                )),
            const SizedBox(
              height: 10,
            ),
            indicatior(),
            const SizedBox(
              height: Distance.d10,
            ),
            Text(
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              widget.text,
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
                widget.index1 == 0 || widget.index1 == 1 || widget.index1 == 2
                    ? const SizedBox.shrink()
                    : ProjectButton(
                        launchUrl: launchUrl2,
                        text: 'Demo',
                        icon: Icons.arrow_outward_rounded)
              ],
            ),
            const SizedBox(
              height: Distance.d20,
            ),
          ]),
        ),
      ],
    );
  }

  Widget indicatior() {
    return AnimatedSmoothIndicator(
        activeIndex: activeindex,
        count: widget.image[widget.index1].length,
        effect: const ExpandingDotsEffect(
            expansionFactor: 2,
            dotColor: ColorsManager.white,
            activeDotColor: ColorsManager.darkblue1));
  }
}
