import 'package:flutter/material.dart';

import '../constants/color_manager.dart';
import '../constants/values.dart';

class HoverSkillCardItem extends StatefulWidget {
  final String skillName;
  final BuildContext context;
  final AssetImage img;

  const HoverSkillCardItem(
      {super.key,
      required this.context,
      required this.img,
      required this.skillName});

  @override
  State<HoverSkillCardItem> createState() => _HoverSkillCardItemState();
}

class _HoverSkillCardItemState extends State<HoverSkillCardItem> {
  bool isHovered = false;

  void _onHoverChanged(bool isHovered) {
    setState(() {
      this.isHovered = isHovered;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return MouseRegion(
      onEnter: (_) => _onHoverChanged(true),
      onExit: (_) => _onHoverChanged(false),
      child: AnimatedContainer(
        padding: const EdgeInsets.symmetric(vertical: 20),
        duration: const Duration(milliseconds: 100),
        width: width > 640 ? width / 4 : width / 2.1,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(Distance.d30),
            topRight: Radius.circular(Distance.d30),
            bottomRight: Radius.circular(Distance.d30),
          ),
          color: ColorsManager.cardcolor,
          gradient: isHovered
              ? const LinearGradient(colors: [
                  ColorsManager.primary,
                  ColorsManager.darkblue1,
                  ColorsManager.primary
                ])
              : null,
          border: Border.all(
            width: isHovered == false ? 4 : 2,
            color:
                isHovered == false ? ColorsManager.blue : ColorsManager.white,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          verticalDirection: VerticalDirection.down,
          textDirection: TextDirection.ltr,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: Distance.d20),
              child: ImageIcon(
                widget.img,
                color: ColorsManager.white,
                size: 40,
              ),
            ),
            const SizedBox(
              width: Distance.d20,
            ),
            Expanded(
              child: Text(
                widget.skillName,
                style: TextStyle(
                  color: ColorsManager.white,
                  fontSize: width > 640 ? width / 50 : width / 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
