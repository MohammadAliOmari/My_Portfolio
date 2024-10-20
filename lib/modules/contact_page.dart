import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:portfolio1_project/shared/components/contacts_card.dart';
import '../shared/components/title_card.dart';
import '../shared/constants/color_manager.dart';
import '../shared/constants/values.dart';

class ContactPage extends StatelessWidget {
  final ScrollController scrlcontroller;
  void scrltotop() {
    scrlcontroller.animateTo(0,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  const ContactPage({super.key, required this.scrlcontroller});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 1000,
      child: Scaffold(
        backgroundColor: ColorsManager.grey.withOpacity(0),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: Distance.d40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: width > 640
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
            children: [
              BounceInDown(
                duration: const Duration(milliseconds: 1500),
                child: const Center(
                  child: TitleCard(text: AppString.contact),
                ),
              ),
              const SizedBox(
                height: Distance.d30,
              ),
              FadeInLeft(
                duration: const Duration(milliseconds: 1500),
                child: const Wrap(
                  direction: Axis.horizontal,
                  spacing: Distance.d20,
                  runSpacing: Distance.d10,
                  children: [
                    HoverContactsCardItem(
                      index: 0,
                      contactName: AppString.email,
                      img: AssetImage('assets/images/icons8-gmail-100.png'),
                    ),
                    HoverContactsCardItem(
                      index: 1,
                      contactName: AppString.phone,
                      img: AssetImage('assets/images/icons8-whatsapp-64.png'),
                    ),
                    HoverContactsCardItem(
                      index: 2,
                      contactName: AppString.github,
                      img: AssetImage('assets/images/icons8-github-100.png'),
                    ),
                    HoverContactsCardItem(
                      index: 3,
                      contactName: AppString.linkedin,
                      img: AssetImage('assets/images/icons8-linkedin.png'),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: Distance.d40,
              ),
              Expanded(
                child: Column(
                  children: [
                    const Center(
                      child: Text(
                        'Thats All',
                        style: TextStyle(
                            fontSize: FontSizeManager.fs14,
                            color: ColorsManager.white),
                      ),
                    ),
                    const SizedBox(
                      height: Distance.d10,
                    ),
                    const Center(
                      child: Icon(
                        Icons.mouse_outlined,
                        size: 30,
                        color: ColorsManager.white,
                      ),
                    ),
                    const SizedBox(
                      height: Distance.d10,
                    ),
                    Center(
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: scrltotop,
                          child: const Text(
                            '-Scroll To Top-',
                            style: TextStyle(
                                fontSize: FontSizeManager.fs18,
                                color: ColorsManager.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.only(top: Distance.d10),
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            border:
                Border(top: BorderSide(color: ColorsManager.blue, width: 3)),
          ),
          child: Text(
            'DEVELOPED BY MOHAMAD OMARI © COPYRIGHT 2024',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: width > 640 ? width * 0.01 : width * 0.03,
                color: ColorsManager.white),
          ),
        ),
      ),
    );
  }
}
