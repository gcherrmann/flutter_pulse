import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/ui/core/themes/app_colors.dart';

class PulseDrawer extends StatelessWidget {
  const PulseDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: AppColors.white,
        child: Padding(
          padding: EdgeInsetsGeometry.only(top: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Scaffold.of(context).closeDrawer();
                    },
                    color: AppColors.tabBarIconOutline,
                    icon: SvgPicture.asset("assets/images/close.svg"),
                    iconSize: 20,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 32,
                    ),
                    child: Row(
                      spacing: 16,
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundImage: NetworkImage(
                            'https://cdn.cloudflare.steamstatic.com/steamcommunity/public/images/avatars/07/07f46e97b4feb6643eeffb59d83f883c4ea55dcc_full.jpg',
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 2,
                          children: [
                            Text(
                              "Zack Hawkins",
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w700,
                                color: AppColors.primaryFontColor,
                              ),
                            ),
                            Text(
                              "Colaborador",
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w400,
                                color: AppColors.primaryFontColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 10),
                ],
              ),

              //Body
              Expanded(
                child: Container(
                  color: AppColors.drawerBackground,
                  child: Column(
                    children: [
                      ListTile(
                        leading: SvgPicture.asset(
                          "assets/images/use_terms.svg",
                        ),
                        title: Text(
                          "Termos de uso",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w400,
                            color: AppColors.primaryFontColor,
                          ),
                        ),
                        onTap: () {
                          Navigator.of(
                            context,
                          ).pushNamed('/terms-of-service');
                        },
                      ),
                      ListTile(
                        leading: SvgPicture.asset("assets/images/exit.svg"),
                        title: Text(
                          "Sair",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w400,
                            color: AppColors.primaryFontColor,
                          ),
                        ),
                        onTap: () {
                          Navigator.of(
                            context,
                          ).pushReplacementNamed('/login');
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
