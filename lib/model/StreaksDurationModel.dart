import 'package:flutter/material.dart';

class StreaksDurationModel {
  final int id;
  final DateTime beginDate;
  final DateTime endDate;
  DateTimeRange duration;
  int durationInSeconds;
  int durationInMinutes;
  int durationInHours;
  int durationInDays;
  num durationInMonths;
  num durationInYears;

  StreaksDurationModel(this.id, this.beginDate, this.endDate) {
    this.duration = DateTimeRange(start: beginDate, end: endDate);
    this.durationInSeconds = duration.duration.inSeconds;
    this.durationInMinutes = duration.duration.inMinutes;
    this.durationInHours = duration.duration.inHours;
    this.durationInDays = duration.duration.inDays;
    this.durationInMonths = duration.duration.inDays / 30;
    this.durationInMonths = duration.duration.inDays / 356;
  }

  String getCurrentStreak(){
    StringBuffer result = new StringBuffer();

    if (beginDate == null || endDate == null) {
      result.write("No Streak Initialized");
    } else {
      DateTimeRange range =
      DateTimeRange(start: beginDate, end: DateTime.now());
      Duration duration = range.duration;
      if (duration.inDays.compareTo(0) > 0) {
        result.write(duration.inDays.toString());
        result.write(" Days of Streak !");
      } else if (duration.inHours.compareTo(0) > 0) {
        result.write(duration.inHours.toString());
        result.write(" Hours of Streak !");
      } else if (duration.inMinutes.compareTo(0) > 0) {
        result.write(duration.inMinutes.toString());
        result.write(" Minutes of Streak !");
      } else {
        result.write(duration.inSeconds.toString());
        result.write(" Seconds of Streak !");
      }
    }
    return result.toString();
  }

  String getMaxStreak(){
    StringBuffer result = new StringBuffer();

    if (beginDate == null || endDate == null) {
      result.write("No Streak Initialized");
    } else {
      DateTimeRange range =
      DateTimeRange(start: beginDate, end: endDate);
      Duration duration = range.duration;
      if (duration.inDays.compareTo(0) > 0) {
        result.write(duration.inDays.toString());
        result.write(" Days of Streak !");
      } else if (duration.inHours.compareTo(0) > 0) {
        result.write(duration.inHours.toString());
        result.write(" Hours of Streak !");
      } else if (duration.inMinutes.compareTo(0) > 0) {
        result.write(duration.inMinutes.toString());
        result.write(" Minutes of Streak !");
      } else {
        result.write(duration.inSeconds.toString());
        result.write(" Seconds of Streak !");
      }
    }
    return result.toString();
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "id": id,
      "beginDate": getConvertedBeginDate(),
      "endDate": getConvertedEndDate(),
      "durationInSeconds": durationInSeconds,
      "durationInMinutes": durationInMinutes,
      "durationInHours": durationInHours,
      "durationInDays": durationInDays,
      "durationInMonths": durationInMonths,
      "durationInYears": durationInYears,
    };
    return map;
  }


  Map<String, dynamic> toMapWithoutId() {
    var map = <String, dynamic>{
      "beginDate": getConvertedBeginDate(),
      "endDate": getConvertedEndDate(),
      "durationInSeconds": durationInSeconds,
      "durationInMinutes": durationInMinutes,
      "durationInHours": durationInHours,
      "durationInDays": durationInDays,
      "durationInMonths": durationInMonths,
      "durationInYears": durationInYears,
    };
    return map;
  }

  List<dynamic> toValuesMapsWithoutId() {
    var map = <dynamic>{
      getConvertedBeginDate(),
      getConvertedEndDate(),
      durationInSeconds,
      durationInMinutes,
      durationInHours,
      durationInDays,
      durationInMonths,
      durationInYears,
    };
    return map.toList();
  }

  String getConvertedBeginDate(){
    return "${beginDate.year.toString()}-${beginDate.month.toString().padLeft(2,'0')}-${beginDate.day.toString().padLeft(2,'0')} ${beginDate.hour.toString().padLeft(2,'0')}:${beginDate.minute.toString().padLeft(2,'0')}:${beginDate.second.toString().padLeft(2,'0')}";
  }

  String getConvertedEndDate(){
    return "${endDate.year.toString()}-${endDate.month.toString().padLeft(2,'0')}-${endDate.day.toString().padLeft(2,'0')} ${endDate.hour.toString().padLeft(2,'0')}:${endDate.minute.toString().padLeft(2,'0')}:${endDate.second.toString().padLeft(2,'0')}";
  }


  static StreaksDurationModel fromMap(Map<String, dynamic> map) {
    int localId = map["id"] == null ? null : map["id"];
    String beginDateStr = map["beginDate"];
    print(beginDateStr);

    String endDateStr = map["endDate"];
    print(endDateStr);

    DateTime beginDateDate = DateTime.parse(beginDateStr);
    DateTime endDateDate = DateTime.tryParse(endDateStr);

    if(localId == null){
      return new StreaksDurationModel(null, beginDateDate, endDateDate);
    }else{
      return new StreaksDurationModel(localId, beginDateDate, endDateDate);
    }
  }
}
