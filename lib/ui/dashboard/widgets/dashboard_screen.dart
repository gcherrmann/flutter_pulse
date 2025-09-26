import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/models/evaluation_model.dart';
import 'package:flutter_template/ui/core/themes/app_colors.dart';
import 'package:flutter_template/ui/core/ui/pulse_drawer.dart';
import 'package:flutter_template/ui/core/ui/pulse_filled_button.dart';
import 'package:flutter_template/ui/core/ui/pulse_picker.dart';
import 'package:flutter_template/ui/dashboard/view_model/dashboard_view_model.dart';
import 'package:flutter_template/ui/dashboard/widgets/dashboard_filter_button.dart';
import 'package:flutter_template/ui/dashboard/widgets/dashboard_filter_modal.dart';
import 'package:flutter_template/ui/dashboard/widgets/evaluation_card.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late DashboardViewModel _viewModel;
  final GlobalKey<ScaffoldState> _sfKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _viewModel = context.read();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _viewModel.initialize();
      _viewModel.filter();
    });
  }

  void filter() {}

  void showFilter(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext sheetContext) {
        return DashboardFilterModal(
          action: _viewModel.setAndFilter,
        );
      },
    );
  }

  Future<void> goToEvaluationDetails(EvaluationModel model) async {
    await Navigator.of(
      context,
    ).pushNamed('/evaluationDetails', arguments: model);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _sfKey,
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.pageBackground,
        leading: IconButton(
          onPressed: () {
            _sfKey.currentState!.openDrawer();
          },
          color: AppColors.regularFontColor,
          icon: SvgPicture.asset("assets/images/menu.svg"),
          iconSize: 20,
        ),
      ),
      drawer: PulseDrawer(),
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
                      color: AppColors.primaryFontColor,
                    ),
                  ),
                  Text(
                    "Veja suas últimas avaliações",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w400,
                      color: AppColors.primaryFontColor,
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
                    color: AppColors.primaryFontColor,
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    SizedBox(width: 16),
                    DashboardFilterButton(
                      label: "Filtros",
                      iconPath: "assets/images/filters_green.svg",
                      action: () {
                        showFilter(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Expanded(
              child: Selector<DashboardViewModel, List<EvaluationModel>>(
                builder: (context, value, child) => ListView.builder(
                  shrinkWrap: true,
                  itemCount: context
                      .read<DashboardViewModel>()
                      .filteredList
                      .length,
                  itemBuilder: (context, index) {
                    final evaluation = context
                        .read<DashboardViewModel>()
                        .filteredList[index];
                    return GestureDetector(
                      onTap: () => goToEvaluationDetails(evaluation),
                      child: EvaluationCard(
                        model: evaluation,
                      ),
                    );
                  },
                ),
                selector: (_, viewModel) => viewModel.filteredList,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
