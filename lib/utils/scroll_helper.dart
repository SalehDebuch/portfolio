import 'package:flutter/material.dart';

class ScrollHelper {
  static Future<void> scrollTo(GlobalKey key, {double alignment = 0.5}) async {
    final RenderBox? renderBox =
        key.currentContext!.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      renderBox.localToGlobal(Offset.zero);
      await Scrollable.ensureVisible(
        key.currentContext!,
        alignment: alignment,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }
}
