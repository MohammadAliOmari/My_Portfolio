import 'package:flutter/material.dart';

import '../constants/color_manager.dart';
import '../constants/values.dart';

class HoverSideBarItem extends StatefulWidget {
  final Icon itemText;
  final Function scroltap;
  final double index;
  final double selectedindex;

  const HoverSideBarItem(
      {super.key,
      required this.itemText,
      required this.scroltap,
      required this.index,
      required this.selectedindex});

  @override
  State<HoverSideBarItem> createState() => _HoverSideBarItemState();
}

class _HoverSideBarItemState extends State<HoverSideBarItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final hoverdtransform = Matrix4.identity()..scale(1.1);
    final transform = isHovered ? hoverdtransform : Matrix4.identity();
    return GestureDetector(
      onTap: () {
        widget.scroltap(widget.index);
      },

      // hoverColor: ColorsManager.blue,
      child: MouseRegion(
        onEnter: (_) => setState(() {
          isHovered = true;
        }),
        onExit: (_) => setState(() {
          isHovered = false;
        }),
        child: AnimatedContainer(
          transform: transform,
          duration: const Duration(milliseconds: 100),
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              strokeAlign: BorderSide.strokeAlignOutside,
              color: widget.selectedindex == widget.index || isHovered
                  ? ColorsManager.blue
                  : ColorsManager.darkblue,
            ),
            shape: BoxShape.circle,
            color: widget.selectedindex == widget.index || isHovered
                ? ColorsManager.black.withBlue(50)
                : ColorsManager.darkblue,
          ),
          alignment: Alignment.center,
          margin: const EdgeInsets.all(Distance.d10),
          height: Distance.d60,
          width: Distance.d60,
          child: widget.itemText,
        ),
      ),
    );
  }
}
