class Question {
  final int id;
  final String title;
  final String titleAr;
  final String type;
  final Illustration illustration;
  final Attachment attachment;
  final int multiple;
  final List<Option> options;
  final dynamic answeredCorrect;
  final dynamic isFlagged;
  final dynamic studentAnswer;
  final List<dynamic> answers;

  Question({
    required this.id,
    required this.title,
    required this.titleAr,
    required this.type,
    required this.illustration,
    required this.attachment,
    required this.multiple,
    required this.options,
    required this.answeredCorrect,
    required this.isFlagged,
    required this.studentAnswer,
    required this.answers,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    List<Option> options = (json['options'] as List)
        .map((optionJson) => Option.fromJson(optionJson))
        .toList();

    return Question(
      id: json['id'],
      title: json['title'],
      titleAr: json['title_ar'],
      type: json['type'],
      illustration: Illustration.fromJson(json['illistraton']),
      attachment: Attachment.fromJson(json['attachment']),
      multiple: json['multiple'],
      options: options,
      answeredCorrect: json['answered_correct'],
      isFlagged: json['is_flagged'],
      studentAnswer: json['student_answer'],
      answers: json['answers'],
    );
  }


  static List<Question> fromJsonList(List<dynamic> json) {
    List<Question> questions = json.map((questionJson) => Question.fromJson(questionJson)).toList();
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
      key: json['key'],
      title: json['title'],
      titleAr: json['title_ar'],
      isCorrect: json['is_correct'],
      isSelected: json['is_selected'],
      attachment: json['attachment'],
    );
  }
}
