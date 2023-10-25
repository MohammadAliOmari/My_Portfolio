import 'package:flutter/material.dart';
import 'package:portfolio1_project/shared/constants/color_manager.dart';
import 'package:portfolio1_project/shared/constants/values.dart';

class ProjectButton extends StatefulWidget {
  final IconData icon;
  final Future Function()? launchUrl;
  final String text;
  const ProjectButton(
      {super.key,
      required this.launchUrl,
      required this.text,
      required this.icon});

  @override
  State<ProjectButton> createState() => _ProjectButtonState();
}

class _ProjectButtonState extends State<ProjectButton> {
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
      onEnter: (event) => _onHoverChanged(true),
      onExit: (event) => _onHoverChanged(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        height: 40,
        width: width > 1000 ? 150 : 115,
        decoration: BoxDecoration(
          color: ColorsManager.cardcolor,
          gradient: isHovered
              ? const LinearGradient(colors: [
                  ColorsManager.primary,
                  ColorsManager.darkblue1,
                  ColorsManager.primary
                ])
              : null,
          borderRadius: BorderRadius.circular(Distance.d10),
          border: Border.all(
              color: isHovered ? Colors.white24 : ColorsManager.darkblue,
              width: 3),
        ),
        child: OutlinedButton.icon(
          onPressed: widget.launchUrl,
          icon: Icon(widget.icon, color: ColorsManager.white),
          label: Text(widget.text,
              style: const TextStyle(
                  fontSize: FontSizeManager.fs16,
                  color: ColorsManager.white,
                  fontWeight: FontWeightManager.bold)),
        ),
      ),
    );
  }
}
