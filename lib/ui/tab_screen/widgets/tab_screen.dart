import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/routing/routes.dart';
import 'package:flutter_template/ui/core/themes/app_colors.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: appTabs[tabIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: tabIndex,
        onTap: (index) {
          setState(() {
            print("Indice = $index");
            tabIndex = index;
          });
        },
        selectedItemColor: AppColors.green,
        unselectedItemColor: AppColors.lightGray,
        selectedLabelStyle: TextStyle(
          fontSize: 12,
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w700,
          color: AppColors.green,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 12,
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w400,
          color: AppColors.tabLabelGray,
        ),
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/heartbeat.svg',
              width: 24,
              height: 24,
            ),
            activeIcon: SvgPicture.asset(
              'assets/images/heartbeat_green.svg',
              width: 24,
              height: 24,
            ),
            label: "Avaliações",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/warning.svg',
              width: 24,
              height: 24,
            ),
            activeIcon: SvgPicture.asset(
              'assets/images/warning_green.svg',
              width: 24,
              height: 24,
            ),
            label: "Alertas",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/bell.svg',
              width: 24,
              height: 24,
            ),
            activeIcon: SvgPicture.asset(
              'assets/images/bell_green.svg',
              width: 24,
              height: 24,
            ),
            label: "Notificações",
          ),
        ],
      ),
    );
  }
}
