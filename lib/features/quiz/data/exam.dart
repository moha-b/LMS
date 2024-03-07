class Exam {
  final int id;
  final String title;
  final String description;
  final String image;
  final int examTime;
  final String examPackage;
  final int examPackageId;
  final int allowedAttempts;
  final int allowBack;
  final DateTime startTime;
  final int minScore;
  final int showAnswer;
  final int desc;
  final int questionsCount;
  final int previousAttempts;
  final List<ExamBreak> breaks;
  final bool breakExists;

  Exam({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.examTime,
    required this.examPackage,
    required this.examPackageId,
    required this.allowedAttempts,
    required this.allowBack,
    required this.startTime,
    required this.minScore,
    required this.showAnswer,
    required this.desc,
    required this.questionsCount,
    required this.previousAttempts,
    required this.breaks,
    required this.breakExists,
  });

  factory Exam.fromJson(Map<String, dynamic> json) {
    List<ExamBreak> breaks = [];
    if (json['breaks'] != null) {
      breaks = List<ExamBreak>.from(
        json['breaks'].map((breakJson) => ExamBreak.fromJson(breakJson)),
      );
    }

    return Exam(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      image: json['image'],
      examTime: json['exam_time'],
      examPackage: json['exam_package'],
      examPackageId: json['exam_package_id'],
      allowedAttempts: json['allowed_attempts'],
      allowBack: json['allow_back'],
      startTime: DateTime.parse(json['start_time']),
      minScore: json['min_score'],
      showAnswer: json['show_answer'],
      desc: json['desc'],
      questionsCount: json['questions_count'],
      previousAttempts: json['previous_attempts'],
      breaks: breaks,
      breakExists: json['breakExists'],
    );
  }
}

class ExamBreak {
  final int time;
  final int question;
  final String message;

  ExamBreak({
    required this.time,
    required this.question,
    required this.message,
  });

  factory ExamBreak.fromJson(Map<String, dynamic> json) {
    return ExamBreak(
      time: json['time'],
      question: json['question'],
      message: json['message'],
    );
  }
}
