import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_template/ui/core/themes/app_colors.dart';

typedef PulsePickerMenuCallback = Function(String value);

class PulsePickerMenu extends StatefulWidget {
  final String _label;
  final String _placeHolder;
  final String _iconPath;
  final double _iconSize;
  final PulsePickerMenuCallback _action;
  final Color _iconColor;
  final List<String> _items;

  PulsePickerMenu({
    super.key,
    required String label,
    required String placeHolder,
    required String iconPath,
    required double iconSize,
    required PulsePickerMenuCallback action,
    required Color iconColor,
    required List<String> items,
  }) : _label = label,
       _placeHolder = placeHolder,
       _iconPath = iconPath,
       _iconSize = iconSize,
       _action = action,
       _iconColor = iconColor,
       _items = items;

  @override
  State<PulsePickerMenu> createState() => _PulsePickerMenuState();
}

class _PulsePickerMenuState extends State<PulsePickerMenu> {
  final layerLink = LayerLink();
  OverlayEntry? entry;

  @override
  void initState() {
    super.initState();
  }

  void hideOverlay() {
    entry?.remove();
    entry = null;
  }

  void showOverlay() {
    RenderBox? renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      final overlay = Overlay.of(context);
      final renderBox = context.findRenderObject() as RenderBox;
      final size = renderBox.size;

      entry = OverlayEntry(
        builder: (context) => Positioned(
          width: size.width,
          child: CompositedTransformFollower(
            link: layerLink,
            offset: Offset(0, size.height + 4),
            child: buildOverlay(),
          ),
        ),
      );
      overlay.insert(entry!);
    }
  }

  Widget buildOverlay() => Material(
    child: Container(
      padding: EdgeInsets.all(4),
      margin: EdgeInsets.all(4),

      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        border: Border.all(
          color: AppColors.borderColor,
          width: 1,
        ),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: 200.0, // Set the maximum height here
        ),

        child: ListView.builder(
          padding: EdgeInsets.all(0),
          shrinkWrap: true,
          itemCount: widget._items.length,
          itemBuilder: (context, index) {
            return TextButton(
              onPressed: () {
                widget._action(widget._items[index]);
                hideOverlay();
              },
              child: Padding(
                padding: EdgeInsetsGeometry.all(8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget._items[index],
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w400,
                      color: AppColors.boldFontColor,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: layerLink,
      child: Column(
        spacing: 4,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            widget._label,
            style: TextStyle(
              fontSize: 14,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w700,
              color: AppColors.boldFontColor,
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              side: BorderSide(
                color: AppColors.borderColor,
                width: 1,
              ),
            ),
            onPressed: () {
              if (entry == null) {
                showOverlay();
              } else {
                hideOverlay();
              }
            },
            child: Padding(
              padding: EdgeInsetsGeometry.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget._placeHolder,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w400,
                      color: AppColors.placeHolderColor,
                    ),
                  ),
                  SvgPicture.asset(
                    widget._iconPath,
                    width: widget._iconSize,
                    colorFilter: ColorFilter.mode(
                      widget._iconColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
