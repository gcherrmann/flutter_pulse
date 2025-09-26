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
        temperature: 35.5,
        oxygen: 98.7,
        pressure: 12.3,
        observation:
            "Cupidatat ea non dolore labore aliqua aute ipsum. Adipisicing deserunt nostrud aliquip tempor laborum ut eu laboris excepteur ipsum ipsum. Cupidatat aliqua deserunt ea laboris occaecat. Laborum nisi tempor adipisicing irure laborum do culpa ea ea sint voluptate aute.",
      ),
      EvaluationModel(
        name: "Johnny Barr",
        type: "Consulta",
        statusColor: AppColors.blue,
        label: "Consulta 2",
        date: DateTime(2025, 10, 7),
        temperature: 40.1,
        oxygen: 96.6,
        pressure: 12.7,
        observation:
            "Cupidatat ea non dolore labore aliqua aute ipsum. Adipisicing deserunt nostrud aliquip tempor laborum ut eu laboris excepteur ipsum ipsum. Cupidatat aliqua deserunt ea laboris occaecat. Laborum nisi tempor adipisicing irure laborum do culpa ea ea sint voluptate aute.",
      ),
      EvaluationModel(
        name: "Freddie Salazar",
        type: "Consulta",
        statusColor: AppColors.green,
        label: "Consulta 3",
        date: DateTime(2025, 4, 15),
        temperature: 34.9,
        oxygen: 98.5,
        pressure: 11.9,
        observation:
            "Cupidatat ea non dolore labore aliqua aute ipsum. Adipisicing deserunt nostrud aliquip tempor laborum ut eu laboris excepteur ipsum ipsum. Cupidatat aliqua deserunt ea laboris occaecat. Laborum nisi tempor adipisicing irure laborum do culpa ea ea sint voluptate aute.",
      ),
      EvaluationModel(
        name: "Tess Myers",
        type: "Retorno",
        statusColor: AppColors.purple,
        label: "Retorno 4",
        date: DateTime(2025, 5, 12),
        temperature: 37.4,
        oxygen: 98.9,
        pressure: 13.3,
        observation:
            "Cupidatat ea non dolore labore aliqua aute ipsum. Adipisicing deserunt nostrud aliquip tempor laborum ut eu laboris excepteur ipsum ipsum. Cupidatat aliqua deserunt ea laboris occaecat. Laborum nisi tempor adipisicing irure laborum do culpa ea ea sint voluptate aute.",
      ),
      EvaluationModel(
        name: "Albert Howe",
        type: "Retorno",
        statusColor: AppColors.orange,
        label: "Retorno 5",
        date: DateTime(2025, 10, 7),
        temperature: 38,
        oxygen: 99.1,
        pressure: 10.8,
        observation:
            "Cupidatat ea non dolore labore aliqua aute ipsum. Adipisicing deserunt nostrud aliquip tempor laborum ut eu laboris excepteur ipsum ipsum. Cupidatat aliqua deserunt ea laboris occaecat. Laborum nisi tempor adipisicing irure laborum do culpa ea ea sint voluptate aute.",
      ),
      EvaluationModel(
        name: "Andreas Orozco",
        type: "Consulta",
        statusColor: AppColors.red,
        label: "Consulta 6",
        date: DateTime(2025, 4, 15),
        temperature: 36.7,
        oxygen: 99.2,
        pressure: 13.1,
        observation:
            "Cupidatat ea non dolore labore aliqua aute ipsum. Adipisicing deserunt nostrud aliquip tempor laborum ut eu laboris excepteur ipsum ipsum. Cupidatat aliqua deserunt ea laboris occaecat. Laborum nisi tempor adipisicing irure laborum do culpa ea ea sint voluptate aute.",
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
