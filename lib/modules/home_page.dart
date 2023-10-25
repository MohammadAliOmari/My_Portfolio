import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio1_project/shared/constants/color_manager.dart';

import '../shared/constants/values.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isWeb = width > 640;
    return FadeIn(
      duration: const Duration(milliseconds: 1500),
      child: SizedBox(
        height: 1000,
        child: Scaffold(
          backgroundColor: ColorsManager.grey.withOpacity(0),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  AppString.im,
                  style: TextStyle(
                    shadows: const [
                      Shadow(
                        color: ColorsManager.lightblue,
                        blurRadius: Distance.d30,
                      ),
                    ],
                    color: ColorsManager.blue,
                    fontSize: isWeb ? width * 0.02 : width * 0.1,
                    fontWeight: FontWeightManager.semibold,
                    fontFamily: 'Caveat',
                  ),
                ),
                const SizedBox(height: Distance.d30),
                Text(
                  AppString.name,
                  style: TextStyle(
                    shadows: const [
                      Shadow(
                        color: ColorsManager.lightblue,
                        blurRadius: Distance.d30,
                      ),
                    ],
                    color: ColorsManager.white,
                    fontSize: isWeb ? width * 0.02 : width * 0.1,
                    fontWeight: FontWeightManager.bold,
                    fontFamily: 'Josefin Sans',
                  ),
                ),
                const SizedBox(height: Distance.d30),
                DefaultTextStyle(
                  style: const TextStyle(
                    shadows: [
                      Shadow(
                        color: ColorsManager.lightblue,
                        blurRadius: Distance.d20,
                      ),
                    ],
                    fontSize: FontSizeManager.fs50,
                    fontWeight: FontWeightManager.semibold,
                    color: ColorsManager.darkblue,
                  ),
                  child: AnimatedTextKit(
                    repeatForever: true,
                    animatedTexts: [
                      TypewriterAnimatedText(
                        AppString.position,
                        textStyle: TextStyle(
                          fontSize: isWeb ? width * 0.02 : width * 0.1,
                          fontWeight: FontWeightManager.semibold,
                          color: ColorsManager.white,
                          fontFamily: 'Caveat',
                        ),
                        speed: const Duration(milliseconds: 100),
                      ),
                      TypewriterAnimatedText(
                        AppString.framework,
                        textStyle: TextStyle(
                          fontSize: isWeb ? width * 0.02 : width * 0.1,
                          fontWeight: FontWeightManager.semibold,
                          color: ColorsManager.white,
                          fontFamily: 'Caveat',
                        ),
                        speed: const Duration(milliseconds: 100),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: Distance.d30),
                Container(
                  height: isWeb ? 400 : 300,
                  width: isWeb ? 400 : 300,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: ColorsManager.white,
                      width: 4,
                    ),
                    shape: BoxShape.circle,
                    image: const DecorationImage(
                      image: AssetImage('assets/images/profile_picture.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: Distance.d40),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(Distance.d10),
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 700),
                      child: Text(
                        AppString.info,
                        style: TextStyle(
                          fontSize: isWeb ? width * 0.01 : width * 0.04,
                          color: ColorsManager.white,
                          fontWeight: FontWeightManager.bold,
                          fontFamily: 'Josefin Sans',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
