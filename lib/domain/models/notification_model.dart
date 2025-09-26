import 'package:flutter_template/domain/enums/notification_status_enum.dart';

class NotificationModel {
  final String title;
  final String message;
  final DateTime date;
  final NotificationStatusEnum type;

  NotificationModel({
    required this.title,
    required this.message,
    required this.date,
    required this.type,
  });
}
