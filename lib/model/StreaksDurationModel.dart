import 'package:flutter/material.dart';

class StreaksDurationModel {
  final DateTime beginDate;
  final DateTime endDate;
  DateTimeRange duration;
  int durationInSeconds;
  int durationInMinutes;
  int durationInHours;
  int durationInDays;
  num durationInMonths;
  num durationInYears;

  StreaksDurationModel(this.beginDate, this.endDate) {
    this.duration = DateTimeRange(start: beginDate, end: endDate);
    this.durationInSeconds = duration.duration.inSeconds;
    this.durationInMinutes = duration.duration.inMinutes;
    this.durationInHours = duration.duration.inHours;
    this.durationInDays = duration.duration.inDays;
    this.durationInMonths = duration.duration.inDays / 30;
    this.durationInMonths = duration.duration.inDays / 356;
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "beginDate": beginDate.toString(),
      "endDate": endDate.toString(),
      "durationInSeconds": durationInSeconds,
      "durationInMinutes": durationInMinutes,
      "durationInHours": durationInHours,
      "durationInDays": durationInDays,
      "durationInMonths": durationInMonths,
      "durationInYears": durationInYears,
    };
    return map;
  }

  static StreaksDurationModel fromMap(Map<String, dynamic> map) {
    DateTime beginDatelocal = DateTime.parse(map["beginDate"]);
    DateTime endDatelocal = DateTime.parse(map["endDate"]);
    return new StreaksDurationModel(beginDatelocal, endDatelocal);
  }
}
