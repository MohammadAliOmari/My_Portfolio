import 'package:flutter/material.dart';
import '../modules/contact_page.dart';
import '../modules/home_page.dart';
import '../modules/projects_page.dart';
import '../modules/skills_page.dart';
import '../shared/components/side_bar_hover.dart';
import '../shared/constants/color_manager.dart';
import '../shared/constants/values.dart';

class PortfolioLayout extends StatefulWidget {
  const PortfolioLayout({super.key});

  @override
  State<PortfolioLayout> createState() => _PortfolioLayoutState();
}

class _PortfolioLayoutState extends State<PortfolioLayout> {
  final List<Icon> listIcons = [
    const Icon(Icons.home_outlined, color: ColorsManager.white),
    const Icon(Icons.account_tree_outlined, color: ColorsManager.white),
    const Icon(Icons.apps_outlined, color: ColorsManager.white),
    const Icon(Icons.call_outlined, color: ColorsManager.white),
  ];
  double selectedindex = 0;
  static ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(onScroll);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void scrolToTap(double index) {
    if (index == 3) {
      scrollController.animateTo(index * 1500,
          duration: const Duration(milliseconds: 500),
          curve: Curves.decelerate);
    } else {
      scrollController.animateTo(index * 1000.0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.decelerate);
    }
  }

  void onScroll() {
    double scrollOffset = scrollController.offset;
    double index = 0;

    for (double i = 0; i < listIcons.length; i++) {
      double startOffset = i * (i == 3 ? 1500 : 1000.0);
      double endOffset = (i + 1) * (i == 2 || i == 3 ? 1500 : 1000.0);

      if (scrollOffset >= startOffset && scrollOffset < endOffset) {
        index = i;
        break;
      }
    }

    if (selectedindex != index) {
      setState(() {
        selectedindex = index;
      });
    }
  }

  final List<Widget> listPages = [
    const HomePage(),
    const SkillPage(),
    const ProjectPage(),
    ContactPage(scrlcontroller: scrollController),
  ];
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            colors: [
              ColorsManager.primary,
              ColorsManager.darkblue1,
              ColorsManager.primary
            ],
          ),
        ),
        child: width >= 800
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: Distance.d10, right: Distance.d10),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: ColorsManager.darkblue),
                          borderRadius: BorderRadius.circular(Distance.d50),
                          color: ColorsManager.grey.withOpacity(0),
                        ),
                        alignment: Alignment.center,
                        height: 340,
                        width: 100,
                        child: Column(
                          children: listIcons.map((icon) {
                            final index = listIcons.indexOf(icon).toDouble();
                            return HoverSideBarItem(
                              itemText: icon,
                              index: index,
                              scroltap: scrolToTap,
                              selectedindex: selectedindex,
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: Distance.d20,
                    ),
                    Expanded(
                        child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      controller: scrollController,
                      itemBuilder: (context, index) {
                        return listPages[index];
                      },
                      itemCount: listPages.length,
                    )),
                  ])
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Distance.d50),
                      color: ColorsManager.white.withOpacity(0),
                      border: Border.all(color: ColorsManager.darkblue),
                    ),
                    height: 70,
                    margin: const EdgeInsets.symmetric(
                      vertical: Distance.d10,
                    ),
                    child: SizedBox(
                      width: 340,
                      child: Center(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: listIcons.length,
                          itemBuilder: (context, index) {
                            return HoverSideBarItem(
                              itemText: listIcons[index],
                              scroltap: scrolToTap,
                              index: index.toDouble(),
                              selectedindex: selectedindex,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      controller: scrollController,
                      itemBuilder: (context, index) {
                        return listPages[index];
                      },
                      itemCount: listPages.length,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
