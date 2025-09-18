import 'package:flutter/material.dart';
import 'package:flutter_template/ui/core/themes/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Builder(
        builder: (context) {
          return IconButton(
            icon: const Icon(Icons.menu),
            color: AppColors.white,
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        },
      ),

      title: Center(child: Text("Title")),
      backgroundColor: AppColors.white,
      actions: [
        IconButton(
          icon: Icon(Icons.notifications),
          color: AppColors.darkGray,
          onPressed: () {},
        ),
      ],
    );
  }
}
