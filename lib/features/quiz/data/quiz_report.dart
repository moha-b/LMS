class QuizReport {
  final int id;
  final String title;
  final int? score;
  final String? message;
  final int? minScore;
  final int? success;
  final int? correctAnswersCount;

  QuizReport({
    required this.id,
    required this.title,
    this.score,
    this.message,
    this.minScore,
    this.success,
    this.correctAnswersCount,
  });

  factory QuizReport.fromJson(Map<String, dynamic> json) {
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
