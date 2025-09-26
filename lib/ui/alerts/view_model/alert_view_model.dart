import 'package:flutter_template/domain/models/alert_model.dart';
import 'package:flutter_template/ui/core/base/base_view_model.dart';

class AlertViewModel extends BaseViewModel {
  DateTime? initialDate;
  DateTime? finalDate;
  List<AlertModel> _alerts = [];
  List<AlertModel> filteredAlerts = [];

  void initialize() {
    _alerts = [
      AlertModel(
        title: "Alerta 1",
        message:
            "Elit Lorem reprehenderit aliquip et consequat ex ut culpa mollit. Cillum incididunt qui anim.",
        date: DateTime(2025, 9, 24),
      ),
      AlertModel(
        title: "Alerta 2",
        message:
            "Elit Lorem reprehenderit aliquip et consequat ex ut culpa mollit. Cillum incididunt qui anim.",
        date: DateTime(2025, 9, 26),
      ),
      AlertModel(
        title: "Alerta 3",
        message:
            "Elit Lorem reprehenderit aliquip et consequat ex ut culpa mollit. Cillum incididunt qui anim.",
        date: DateTime(2025, 9, 26),
      ),
      AlertModel(
        title: "Alerta 4",
        message:
            "Elit Lorem reprehenderit aliquip et consequat ex ut culpa mollit. Cillum incididunt qui anim.",
        date: DateTime(2025, 9, 26),
      ),
      AlertModel(
        title: "Alerta 5",
        message:
            "Elit Lorem reprehenderit aliquip et consequat ex ut culpa mollit. Cillum incididunt qui anim.",
        date: DateTime(2025, 9, 25),
      ),
      AlertModel(
        title: "Alerta 6",
        message:
            "Elit Lorem reprehenderit aliquip et consequat ex ut culpa mollit. Cillum incididunt qui anim.",
        date: DateTime(2025, 9, 25),
      ),
    ];
    filteredAlerts = [..._alerts];
  }

  void setFilter(
    DateTime? initialDateSelected,
    DateTime? finalDateSelected,
  ) {
    initialDate = initialDateSelected;
    finalDate = finalDateSelected;

    filter();
  }

  void filter() {
    var tempList = [..._alerts];

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
    filteredAlerts = [...tempList];
    notifyListeners();
  }
}
