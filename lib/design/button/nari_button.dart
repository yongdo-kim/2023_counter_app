import 'package:counter2023/design/color/nari_color.dart';
import 'package:counter2023/design/font/nari_font.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NariButton extends StatelessWidget {
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final String? text;
  final IconData? iconData;
  final double? iconSize;
  final Color? backgroundColor;
  final Function() onTap;
  final Function()? onLongTap;

  const NariButton({
    super.key,
    this.width,
    this.height,
    this.padding,
    this.text,
    this.iconData,
    this.iconSize,
    this.backgroundColor,
    required this.onTap,
    this.onLongTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onLongPress: onLongTap,
        onTap: onTap,
        child: Container(
            alignment: Alignment.center,
            width: width ?? MediaQuery.of(context).size.width,
            height: height ?? 80,
            decoration: BoxDecoration(
              color: backgroundColor ?? NariColor.primaryColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 3,
                  blurRadius: 4,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(
                  iconData,
                  color: Colors.white,
                  size: iconSize ?? 32,
                ),
                Visibility(
                  visible: text?.isNotEmpty ?? false,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      text ?? "",
                      style: NariFont.bold24.copyWith(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
