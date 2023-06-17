import 'package:counter2023/design/color/nari_color.dart';
import 'package:flutter/material.dart';

class NariCard extends StatelessWidget {
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final String? text;
  final double? iconSize;
  final Color? backgroundColor;
  final Function()? onTap;
  final Widget child;

  const NariCard({
    super.key,
    this.width,
    this.height,
    this.padding,
    this.text,
    this.iconSize,
    this.backgroundColor,
    this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
            alignment: Alignment.center,
            width: width ?? MediaQuery.of(context).size.width,
            height: height ?? 80,
            decoration: BoxDecoration(
              color: backgroundColor ?? NariColor.primaryWhite,
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
            child: child),
      ),
    );
  }
}
