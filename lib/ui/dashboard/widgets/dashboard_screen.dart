import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/ui/core/themes/app_colors.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<ScaffoldState> _sfKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _sfKey,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            _sfKey.currentState!.openDrawer();
          },
          color: AppColors.regularFontColor,
          icon: SvgPicture.asset("assets/images/menu.svg"),
          iconSize: 20,
        ),
      ),
      drawer: Drawer(
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
                        _sfKey.currentState!.closeDrawer();
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
                                  color: AppColors.boldFontColor,
                                ),
                              ),
                              Text(
                                "Colaborador",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.boldFontColor,
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
                              color: AppColors.boldFontColor,
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
                              color: AppColors.boldFontColor,
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  Text(
                    "Olá Rodrigo",
                    style: TextStyle(
                      fontSize: 28,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w700,
                      color: AppColors.boldFontColor,
                    ),
                  ),
                  Text(
                    "Veja suas últimas avaliações",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w400,
                      color: AppColors.boldFontColor,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 64,
            ),
            Row(
              children: [
                Text(
                  "AVALIAÇÕES",
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w700,
                    color: AppColors.boldFontColor,
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    FilledButton(
                      onPressed: () {},
                      style: FilledButton.styleFrom(
                        backgroundColor: AppColors.white,
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                      ),
                      child: Row(
                        spacing: 8,
                        children: [
                          SvgPicture.asset("assets/images/graphics.svg"),
                          Text(
                            "Gráfico",
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w700,
                              color: AppColors.boldFontColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 16),
                    FilledButton(
                      onPressed: () {},
                      style: FilledButton.styleFrom(
                        backgroundColor: AppColors.white,
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                      ),
                      child: Row(
                        spacing: 8,
                        children: [
                          SvgPicture.asset("assets/images/filters_green.svg"),
                          Text(
                            "Filtros",
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w700,
                              color: AppColors.boldFontColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(12),
                    margin: EdgeInsets.only(bottom: 8),

                    decoration: BoxDecoration(
                      color: AppColors.white,
                      border: Border.all(
                        color: AppColors.white,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      spacing: 14,
                      children: [
                        Row(
                          spacing: 10,
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                              ),
                            ),
                            Text(
                              "Consulta 1",
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w700,
                                color: AppColors.boldFontColor,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              spacing: 2,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Profissional",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.boldFontColor50,
                                  ),
                                ),
                                Text(
                                  "Zack Hawkins",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.boldFontColor,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 2,
                              children: [
                                Text(
                                  "Data",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.boldFontColor50,
                                  ),
                                ),
                                Text(
                                  "23/05/2020",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.boldFontColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
