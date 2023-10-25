import 'dart:math';

import 'package:flutter/material.dart';

import '../constants/color_manager.dart';
import '../constants/values.dart';

class TitleCard extends StatelessWidget {
  final String? text;

  const TitleCard({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // First Container
        Transform.rotate(
          angle: pi / 1,
          child: Container(
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(Distance.d20),
              color: ColorsManager.darkblue,
              border: Border.all(
                color: ColorsManager.blue,
                width: 3,
              ),
            ),
            width: 250,
            height: 120,
          ),
        ),
        // Second Container

        Transform.rotate(
          angle: -pi / 19,
          child: Container(
            decoration: BoxDecoration(
              color: ColorsManager.primary,
              border: Border.all(
                color: ColorsManager.white,
              ),
            ),
            width: 270,
            height: 110,
          ),
        ),
        Text(
          text!,
          style: TextStyle(
            shadows: const [
              Shadow(
                color: ColorsManager.lightblue,
                blurRadius: Distance.d30,
              )
            ],
            color: ColorsManager.white,
            fontSize: MediaQuery.of(context).size.width > 640
                ? MediaQuery.of(context).size.width * 0.02
                : MediaQuery.of(context).size.width * 0.1,
            fontWeight: FontWeightManager.semibold,
          ),
        )
      ],
    );
  }
}
