import 'package:flutter/material.dart';

class EvaluationModel {
  final String label;
  final String type;
  final Color statusColor;
  final String name;
  final DateTime date;
  final double temperature;
  final double oxygen;
  final double pressure;
  final String observation;

  EvaluationModel({
    required this.label,
    required this.type,
    required this.statusColor,
    required this.name,
    required this.date,
    required this.temperature,
    required this.oxygen,
    required this.pressure,
    required this.observation,
  });
}
