import 'package:flutter/material.dart';

class CourseStatusModel {
  String title;
  String? description;
  IconData icon;
  CourseStatusModel(
      {required this.title, this.description, required this.icon});
}
