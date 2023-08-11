import 'package:flutter/material.dart';

class HeaderItem {
  final String title;
  final VoidCallback? onTap;
  final bool isButton;
  Color? textColor;

  HeaderItem({
    required this.title,
    this.onTap,
    this.textColor,
    this.isButton = false,
  });
}
