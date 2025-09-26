typedef PulseDashboardFilterCallback =
    Function(
      String? typeSelected,
      DateTime? initialDateSelected,
      DateTime? finalDateSelected,
    );

typedef PulseAlertFilterCallback =
    Function(
      DateTime? initialDateSelected,
      DateTime? finalDateSelected,
    );
