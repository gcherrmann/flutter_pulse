import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/domain/models/evaluation_model.dart';
import 'package:flutter_template/ui/core/themes/app_colors.dart';
import 'package:flutter_template/ui/evaluation_details/widgets/evaluation_item.dart';
import 'package:flutter_template/utils/functions.dart';

class EvaluationDetailsScreen extends StatelessWidget {
  const EvaluationDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final model = ModalRoute.of(context)!.settings.arguments as EvaluationModel;
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.pageBackground,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: SvgPicture.asset("assets/images/arrow_back.svg"),
          iconSize: 20,
        ),
        centerTitle: true,
        title: Text(
          model.label,
          style: TextStyle(
            fontSize: 18,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w700,
            color: AppColors.primaryFontColor,
          ),
        ),
      ),
      body: Container(
        color: AppColors.pageBackground,
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 4,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Exibindo",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.primaryFontColor
                                        .withValues(
                                          alpha: 0.5,
                                        ),
                                  ),
                                ),
                                Text(
                                  Functions.formatDate(model.date),
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.primaryFontColor
                                        .withValues(
                                          alpha: 0.7,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "Avaliações de temperatura",
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w500,
                                color: AppColors.primaryFontColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Text(
                        "Dados da consulta",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryFontColor,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Column(
                        spacing: 4,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          EvaluationItem(
                            title: "Temperatura",
                            value: "${model.temperature.toString()}º",
                          ),
                          EvaluationItem(
                            title: "Oxigênio",
                            value: "${model.oxygen.toString()}%",
                          ),
                          EvaluationItem(
                            title: "Pressão",
                            value: "${model.pressure.toString()} mmHg",
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 24,
                      ),
                      Text(
                        "Observação do profissional de saúde",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryFontColor,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        model.observation,
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryFontColor,
                        ),
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
