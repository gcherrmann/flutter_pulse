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
        name: "Albert Howe",
        type: "Consulta",
        statusColor: AppColors.blue,
        label: "Consulta 1",
        date: DateTime(2025, 1, 1),
      ),
      EvaluationModel(
        name: "Johnny Barr",
        type: "Consulta",
        statusColor: AppColors.blue,
        label: "Consulta 2",
        date: DateTime(2025, 10, 7),
      ),
      EvaluationModel(
        name: "Freddie Salazar",
        type: "Consulta",
        statusColor: AppColors.green,
        label: "Consulta 3",
        date: DateTime(2025, 4, 15),
      ),
      EvaluationModel(
        name: "Tess Myers",
        type: "Retorno",
        statusColor: AppColors.purple,
        label: "Retorno 4",
        date: DateTime(2025, 5, 12),
      ),
      EvaluationModel(
        name: "Albert Howe",
        type: "Retorno",
        statusColor: AppColors.orange,
        label: "Retorno 5",
        date: DateTime(2025, 10, 7),
      ),
      EvaluationModel(
        name: "Andreas Orozco",
        type: "Consulta",
        statusColor: AppColors.red,
        label: "Consulta 6",
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
