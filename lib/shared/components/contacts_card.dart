import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/color_manager.dart';
import '../constants/values.dart';

class HoverContactsCardItem extends StatefulWidget {
  final String contactName;
  final AssetImage img;
  final int index;

  const HoverContactsCardItem(
      {super.key,
      required this.index,
      required this.img,
      required this.contactName});

  @override
  State<HoverContactsCardItem> createState() => _HoverContactsCardItemState();
}

class _HoverContactsCardItemState extends State<HoverContactsCardItem> {
  bool isHovered = false;

  Future<dynamic> launchUrl1() async {
    if (!await launchUrl(listofurl[widget.index])) {
      throw Exception('Could not launch $listoftext');
    }
  }

  void _onHoverChanged(bool isHovered) {
    setState(() {
      this.isHovered = isHovered;
    });
  }

  List<String> listoftext = [
    AppString.email,
    AppString.phone,
    AppString.githubLink,
  ];
  List<Uri> listofurl = [
    Uri.parse('mailto:${AppString.email}'),
    Uri.parse('https://wa.me/0797466240'),
    Uri.parse(AppString.githubLink),
  ];

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final bool isWeb = width > 640;
    return GestureDetector(
      onTap: launchUrl1,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => _onHoverChanged(true),
        onExit: (_) => _onHoverChanged(false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          height: 120,
          width: isWeb ? width / 2 : width,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(Distance.d40),
              topRight: Radius.circular(Distance.d40),
              bottomRight: Radius.circular(Distance.d40),
            ),
            color: ColorsManager.cardcolor,
            gradient: isHovered
                ? const LinearGradient(colors: [
                    ColorsManager.primary,
                    ColorsManager.darkblue1,
                    ColorsManager.cardcolor,
                  ])
                : null,
            border: Border.all(
              width: !isHovered ? 4 : 2,
              color: !isHovered ? ColorsManager.blue : ColorsManager.white,
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
                child: Container(
                  padding: const EdgeInsets.only(left: Distance.d10),
                  height: 80,
                  decoration: BoxDecoration(
                      border: Border(
                          left: BorderSide(
                    color:
                        !isHovered ? ColorsManager.blue : ColorsManager.white,
                    width: 4,
                  ))),
                  child: ImageIcon(
                    widget.img,
                    color: ColorsManager.white,
                    size: 40,
                  ),
                ),
              ),
              const SizedBox(
                width: Distance.d20,
              ),
              Expanded(
                child: Text(
                  widget.contactName,
                  style: TextStyle(
                    color: ColorsManager.white,
                    fontSize: isWeb ? width * 0.02 : width * 0.03,
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {
                    Clipboard.setData(
                        ClipboardData(text: listoftext[widget.index]));
                  },
                  icon: const Icon(Icons.copy_outlined,
                      color: ColorsManager.white, size: 30)),
              const SizedBox(
                width: Distance.d20,
              ),
            ],
          ),
          //
        ),
      ),
    );
  }
}
