import 'exam.dart';

class QuizReport extends Exam {
  final int score;
  final String message;
  final int minScore;
  final int success;
  final int correctAnswersCount;

  QuizReport({
    super.id = 1,
    super.title = '',
    this.score = 0,
    this.message = '',
    this.minScore = 0,
    this.success = 0,
    this.correctAnswersCount = 0,
  });

  @override
  QuizReport fromJson(Map<String, dynamic> json) {
    return QuizReport(
      id: json['id'],
      title: json['title'],
      success: json['success'],
      score: json['score'],
      message: json['message'],
      minScore: json['min_score'],
      correctAnswersCount: json['correct_answers_count'],
    );
  }
}
