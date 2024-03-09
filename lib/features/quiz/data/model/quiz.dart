import 'exam.dart';

class Quiz extends Exam {
  final String description;
  final String image;
  final int examTime;
  final String examPackage;
  final int examPackageId;
  final int allowedAttempts;
  final int allowBack;
  final DateTime? startTime;
  final int minScore;
  final int showAnswer;
  final int desc;
  final int questionsCount;
  final int previousAttempts;
  final bool breakExists;

  Quiz({
     super.id=0,
     super.title='',
     this.description='',
     this.image='',
     this.examTime=0,
     this.examPackage='',
     this.examPackageId=0,
     this.allowedAttempts=0,
     this.allowBack=0,
     this.startTime,
     this.minScore=0,
     this.showAnswer=0,
     this.desc=0,
     this.questionsCount=0,
     this.previousAttempts=0,
    this.breakExists=false,
  });

  @override
  Quiz fromJson(Map<String, dynamic> json) {
    return Quiz(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      image: json['image'] ?? '',
      examTime: json['exam_time'],
      examPackage: json['exam_package'] ?? '',
      examPackageId: json['exam_package_id'],
      allowedAttempts: json['allowed_attempts'],
      allowBack: json['allow_back'],
      startTime: DateTime.parse(json['start_time']),
      minScore: json['min_score'],
      showAnswer: json['show_answer'],
      desc: json['desc'],
      questionsCount: json['questions_count'],
      previousAttempts: json['previous_attempts'],
      breakExists: json['breakExists'],
    );
  }
}
