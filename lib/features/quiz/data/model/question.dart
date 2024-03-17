import 'exam.dart';

class Question extends Exam {
  final String titleAr;
  final String type;
  final Illustration? illustration;
  final Attachment? attachment;
  final int multiple;
  final List<Option>? options;
  final dynamic answeredCorrect;
  final dynamic isFlagged;
  final dynamic studentAnswer;
  final List<dynamic>? answers;

  Question({
    super.id = 0,
    super.title = '',
    this.titleAr = '',
    this.type = '',
    this.illustration,
    this.attachment,
    this.multiple = 0,
    this.options,
    this.answeredCorrect,
    this.isFlagged,
    this.studentAnswer,
    this.answers,
  });

  @override
  Question fromJson(Map<String, dynamic> json) {
    List<Option> options = (json['options'] as List)
        .map((optionJson) => Option.fromJson(optionJson))
        .toList();

    return Question(
      id: json['id'],
      title: json['title'],
      titleAr: json['title_ar'] ?? '',
      type: json['type'] ?? '',
      illustration: Illustration.fromJson(json['illistraton']),
      attachment: json['attachment'] != null ? Attachment.fromJson(json['attachment']) : null,
      // attachment:  Attachment.fromJson(json['attachment']),
      multiple: json['multiple'],
      options: options,
      answeredCorrect: json['answered_correct'],
      isFlagged: json['is_flagged'],
      studentAnswer: json['student_answer'],
      answers: json['answers'],
    );
  }

  static List<Question> fromJsonList(List<dynamic> json) {
    Question question = Question();
    List<Question> questions =
        json.map((questionJson) => question.fromJson(questionJson)).toList();
    return questions;
  }
}

class Illustration {
  final String text;

  Illustration({required this.text});

  factory Illustration.fromJson(Map<String, dynamic> json) {
    return Illustration(
      text: json['text'],
    );
  }
}

class Attachment {
  final String type;
  final String url;

  Attachment({required this.type, required this.url});

  factory Attachment.fromJson(Map<String, dynamic> json) {
    return Attachment(
      type: json['type'],
      url: json['url'],
    );
  }
}

class Option {
  final String key;
  final String title;
  final String titleAr;
  final int isCorrect;
  final int isSelected;
  final dynamic attachment;

  Option({
    required this.key,
    required this.title,
    required this.titleAr,
    required this.isCorrect,
    required this.isSelected,
    required this.attachment,
  });

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      key: json['key'] ?? '',
      title: json['title'] ?? '',
      titleAr: json['title_ar'] ?? '',
      isCorrect: json['is_correct'] ?? -1,
      isSelected: json['is_selected'] ?? -1,
      attachment: json['attachment'],
    );
  }
}
