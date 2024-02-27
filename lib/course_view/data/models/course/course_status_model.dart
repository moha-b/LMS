import 'package:flutter/material.dart';
import 'package:lms/utils/app_icons.dart';

class CourseStatusModel {
  String title;
  String description;
  IconData icon;

  CourseStatusModel(
      {required this.title, required this.description, required this.icon});
}

List<CourseStatusModel> courses = [
  CourseStatusModel(
      title: 'Release Date', description: 'Oct, 2021', icon: AppIcons.note_1),
  CourseStatusModel(title: 'Students', description: '130', icon: AppIcons.user),
  CourseStatusModel(
      title: 'Duration', description: '8 hours', icon: AppIcons.clock),
  CourseStatusModel(
      title: 'Lectures', description: '15', icon: AppIcons.document_text),
];
