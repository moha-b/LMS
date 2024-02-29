import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CourseStatusModel {
  String title;
  String description;
  IconData icon;
  CourseStatusModel(
      {required this.title, required this.description, required this.icon});

  // String formatDate(String dateTimeString) {
  //   // DateTime dateTime = DateTime.parse(dateTimeString);
  //   // String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
  //   // return formattedDate;
  // }
}
