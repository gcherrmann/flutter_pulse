import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/domain/models/alert_model.dart';
import 'package:flutter_template/ui/alerts/view_model/alert_view_model.dart';
import 'package:flutter_template/ui/alerts/widgets/alert_filter_modal.dart';
import 'package:flutter_template/ui/core/themes/app_colors.dart';
import 'package:flutter_template/ui/core/ui/pulse_drawer.dart';
import 'package:flutter_template/utils/functions.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:provider/provider.dart';

class AlertScreen extends StatefulWidget {
  const AlertScreen({super.key});

  @override
  State<AlertScreen> createState() => _AlertScreenState();
}

class _AlertScreenState extends State<AlertScreen> {
  final GlobalKey<ScaffoldState> _sfKey = GlobalKey();
  late AlertViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = context.read();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _viewModel.initialize();
      _viewModel.filter();
    });
  }

  void showFilter(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext sheetContext) {
        return AlertFilterModal(
          viewModel: _viewModel,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _sfKey,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.pageBackground,
        leading: IconButton(
          onPressed: () {
            _sfKey.currentState!.openDrawer();
          },
          icon: SvgPicture.asset("assets/images/menu.svg"),
          iconSize: 20,
        ),
        actions: [
          IconButton(
            onPressed: () {
              showFilter(context);
            },
            icon: SvgPicture.asset("assets/images/filter.svg"),
            iconSize: 20,
          ),
        ],
        centerTitle: true,
        title: Text(
          "Alertas",
          style: TextStyle(
            fontSize: 18,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w700,
            color: AppColors.primaryFontColor,
          ),
        ),
      ),
      drawer: PulseDrawer(),
      body: Selector<AlertViewModel, List<AlertModel>>(
        builder: (context, filteredList, child) =>
            GroupedListView<AlertModel, String>(
              padding: EdgeInsets.symmetric(horizontal: 16),
              elements: filteredList,
              groupSeparatorBuilder: (value) => Row(
                children: [
                  Expanded(
                    child: Divider(
                      height: 1,
                      color: AppColors.listDateText.withValues(alpha: 0.3),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(16),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.listDateSeparatorBackground.withValues(
                        alpha: 0.4,
                      ),
                      borderRadius: BorderRadius.circular(
                        8,
                      ),
                    ),
                    child: Text(
                      value,
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryFontColor.withValues(
                          alpha: 0.4,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      height: 1,
                      color: AppColors.listDateText.withValues(alpha: 0.3),
                    ),
                  ),
                ],
              ),
              itemBuilder: (context, model) => Container(
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
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 12,
                      children: [
                        CircleAvatar(
                          radius: 24,
                          backgroundColor: AppColors.red10,
                          child: SvgPicture.asset(
                            "assets/images/warning.svg",
                            colorFilter: ColorFilter.mode(
                              AppColors.red,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            spacing: 4,
                            mainAxisAlignment: MainAxisAlignment.start,

                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    model.title,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.primaryFontColor
                                          .withValues(
                                            alpha: 0.6,
                                          ),
                                    ),
                                  ),
                                  Text(
                                    Functions.formatDate(model.date),
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.primaryFontColor
                                          .withValues(
                                            alpha: 0.6,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                model.message,
                                style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.primaryFontColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              groupBy: (element) => Functions.formatDate(element.date),
            ),
        selector: (_, viewModel) => viewModel.filteredAlerts,
      ),
    );
  }
}
