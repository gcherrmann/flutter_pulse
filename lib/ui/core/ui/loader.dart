import 'package:flutter/material.dart';
import 'package:flutter_template/ui/core/themes/app_colors.dart';

class Loader {
  static OverlayEntry? _overlayEntry;
  static bool _open = false;

  static void showOverlay(BuildContext context) {
    _overlayEntry ??= OverlayEntry(
      builder: (context) => Container(
        color: Colors.transparent,
        child: Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              padding: EdgeInsets.all(20),
              color: Colors.transparent,
              child: CircularProgressIndicator(
                color: AppColors.green,
              ),
            ),
          ),
        ),
      ),
    );
    if (!_open) {
      _open = true;
      Overlay.of(context).insert(_overlayEntry!);
    }
  }

  static void removeOverlay() {
    if (_open) {
      _open = false;
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }
}
