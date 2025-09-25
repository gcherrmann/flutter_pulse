import 'package:flutter_template/models/evaluation_model.dart';
import 'package:flutter_template/ui/core/base/base_view_model.dart';
import 'package:flutter_template/ui/core/themes/app_colors.dart';

class DashboardViewModel extends BaseViewModel {
  String? filterType;
  DateTime? initialDate;
  DateTime? finalDate;

  List<EvaluationModel> evaluationList = [];

  List<EvaluationModel> filteredList = [];

  void initialize() {
    evaluationList = [
      EvaluationModel(
        label: "Albert Howe",
        type: "Consulta",
        statusColor: AppColors.blue,
        name: "Consulta 1",
        date: DateTime(2025, 1, 1),
      ),
      EvaluationModel(
        label: "Johnny Barr",
        type: "Consulta",
        statusColor: AppColors.blue,
        name: "Consulta 2",
        date: DateTime(2025, 10, 7),
      ),
      EvaluationModel(
        label: "Freddie Salazar",
        type: "Consulta",
        statusColor: AppColors.green,
        name: "Consulta 3",
        date: DateTime(2025, 4, 15),
      ),
      EvaluationModel(
        label: "Tess Myers",
        type: "Retorno",
        statusColor: AppColors.purple,
        name: "Consulta 4",
        date: DateTime(2025, 1, 1),
      ),
      EvaluationModel(
        label: "Albert Howe",
        type: "Retorno",
        statusColor: AppColors.orange,
        name: "Consulta 5",
        date: DateTime(2025, 10, 7),
      ),
      EvaluationModel(
        label: "Andreas Orozco",
        type: "Consulta",
        statusColor: AppColors.red,
        name: "Consulta 6",
        date: DateTime(2025, 4, 15),
      ),
    ];
    filteredList = [...evaluationList];
  }

  void setAndFilter(
    String? typeSelected,
    DateTime? initialDateSelected,
    DateTime? finalDateSelected,
  ) {
    filterType = typeSelected;
    initialDate = initialDateSelected;
    finalDate = finalDateSelected;

    filter();
  }

  void filter() {
    var tempList = [...evaluationList];
    if (filterType != null) {
      tempList = tempList.where((i) => i.type == filterType).toList();
    }
    if (initialDate != null) {
      tempList = tempList
          .where((i) => i.date.compareTo(initialDate!) >= 0)
          .toList();
    }
    if (finalDate != null) {
      tempList = tempList
          .where((i) => i.date.compareTo(finalDate!) <= 0)
          .toList();
    }
    filteredList = [...tempList];
    notifyListeners();
  }
}
