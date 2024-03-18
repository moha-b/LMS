class LessonModel {
  final int id;
  final String title;
  final int chapterId;
  final int courseId;
  final String image;
  final String description;
  final String? videoUrl;
  final int isFree;
  final String zoomCode;
  final String zoomPassword;
  final String activeDate;
  final int totalMinutes;
  final String vimeoIframe;
  final dynamic vdocipherData;
  final String streamingType;
  final List<Faq> faqs;

  LessonModel({
    required this.id,
    required this.title,
    required this.chapterId,
    required this.courseId,
    required this.image,
    required this.description,
    required this.videoUrl,
    required this.isFree,
    required this.zoomCode,
    required this.zoomPassword,
    required this.activeDate,
    required this.totalMinutes,
    required this.vimeoIframe,
    required this.vdocipherData,
    required this.streamingType,
    required this.faqs,
  });

  factory LessonModel.fromJson(Map<String, dynamic> json) {
    List<Faq> faqsList = [];
    if (json['faqs'] != null) {
      faqsList = List<Faq>.from(json['faqs'].map((faq) => Faq.fromJson(faq)));
    }
    return LessonModel(
      id: json['id'],
      title: json['title'] ?? "",
      chapterId: json['chapter_id'],
      courseId: json['course_id'],
      image: json['image'] ?? "",
      description: json['description'] ?? "",
      videoUrl: json['video_url'] ?? "",
      isFree: json['is_free'],
      zoomCode: json['zoom_code'] ?? "",
      zoomPassword: json['zoom_password'] ?? "",
      activeDate: json['active_date'] ?? "",
      totalMinutes: json['total_minutes'],
      vimeoIframe: json['vimeo_iframe'] ?? "",
      vdocipherData: json['vdocipher_data'],
      streamingType: json['streaming_type'] ?? "",
      faqs: faqsList,
    );
  }
}

class Faq {
  final String title;
  final String created;
  final String? answer;
  final String? answerAt;

  Faq({
    required this.title,
    required this.created,
    required this.answer,
    required this.answerAt,
  });

  factory Faq.fromJson(Map<String, dynamic> json) {
    return Faq(
      title: json['title'] ?? "",
      created: json['created'] ?? "",
      answer: json['answer'] ?? "",
      answerAt: json['answer_at'] ?? "",
    );
  }
}
