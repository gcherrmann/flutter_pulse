import 'package:flutter/material.dart';

class EvaluationModel {
  final String label;
  final String type;
  final Color statusColor;
  final String name;
  final DateTime date;

  EvaluationModel({
    required this.label,
    required this.type,
    required this.statusColor,
    required this.name,
    required this.date,
  });
}
