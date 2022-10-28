import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:study_app/configs/themes/app_colors.dart';
import 'package:study_app/extensions/context_extension.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    Key? key,
    this.title,
    this.color = Colors.white,
    required this.press,
    this.enabled = true,
    this.svgPic,
    this.isSvg = false,
    this.icon,
  }) : super(key: key);

  final String? svgPic;
  final bool isSvg;
  final String? title;
  final bool enabled;
  final Color? color;
  final VoidCallback press;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      width: double.maxFinite,
      child: ElevatedButton.icon(
        label: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text(
            title ?? "",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: context.isDarkMode
                    ? onSurfaceTextColor
                    : context.primaryColor),
          ),
        ),
        onPressed: enabled == false ? null : press,
        style: OutlinedButton.styleFrom(
            alignment: Alignment.centerLeft,
            backgroundColor: color,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
        icon: isSvg ? SvgPicture.asset(svgPic!) : Icon(icon),
      ),
    );
  }
}
