import 'package:flutter/material.dart';

class HeaderItem {
  final String title;
  final VoidCallback onTap;
  final bool isButton;
  Color textColor;

  HeaderItem({
    this.title,
    this.onTap,
    this.isButton = false,
  });
}
