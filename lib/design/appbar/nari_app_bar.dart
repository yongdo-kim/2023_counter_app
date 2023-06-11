// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:counter2023/design/color/nari_color.dart';
import 'package:counter2023/design/font/nari_font.dart';
import 'package:flutter/material.dart';

class NariAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> actions;
  final String title;
  const NariAppBar({
    Key? key,
    required this.actions,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: NariFont.bold24.copyWith(color: NariColor.primaryBlack),
      ),
      elevation: 0,
      backgroundColor: NariColor.primaryWhite,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
