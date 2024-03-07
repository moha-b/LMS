class Course {
  final int id;
  final String title;
  final num price;
  final int lastLesson;
  final int totalMinutes;
  final String image;
  final DateTime created;
  final String description;
  final bool isFree;
  final bool lifeTimeAccess;
  final int duration;
  final num rate;
  final int rateCount;
  final Enrollment enrollment;
  final bool inWishlist;
  final List<Chapter> chapters;
  final List<Instructor> instructors;
  final List<dynamic> extendsList;
  final int studentsCount;
  final String certificate;
  final List<int> trackId;

  Course({
    required this.id,
    required this.title,
    required this.price,
    required this.lastLesson,
    required this.totalMinutes,
    required this.image,
    required this.created,
    required this.description,
    required this.isFree,
    required this.lifeTimeAccess,
    required this.duration,
    required this.rate,
    required this.rateCount,
    required this.enrollment,
    required this.inWishlist,
    required this.chapters,
    required this.instructors,
    required this.extendsList,
    required this.studentsCount,
    required this.certificate,
    required this.trackId,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['data']['id'],
      title: json['data']['title'],
      price: json['data']['price'],
      lastLesson: json['data']['last_lesson'],
      totalMinutes: json['data']['total_minutes'],
      image: json['data']['image'],
      created: DateTime.parse(json['data']['created']),
      description: json['data']['description'],
      isFree: json['data']['is_free'] == 1,
      lifeTimeAccess: json['data']['life_time_access'] == 1,
      duration: json['data']['duration'],
      rate: json['data']['rate'],
      rateCount: json['data']['rate_count'],
      enrollment: Enrollment.fromJson(json['data']['enrollment']),
      inWishlist: json['data']['in_wishlist'] == 1,
      chapters: (json['data']['chapters'] as List<dynamic>)
          .map((chapterJson) => Chapter.fromJson(chapterJson))
          .toList(),
      instructors: (json['data']['instructors'] as List<dynamic>)
          .map((instructorJson) => Instructor.fromJson(instructorJson))
          .toList(),
      extendsList: json['data']['extends'],
      studentsCount: json['data']['students_count'],
      certificate: json['data']['certificate'],
      trackId: (json['data']['track_id'] as List<dynamic>).cast<int>(),
    );
  }
}

class LessonDetailsArguments {
  final int lessonId;
  final List<Chapter> chapter;

  LessonDetailsArguments(this.lessonId, this.chapter);
}

class Chapter {
  final int id;
  final String title;
  final List<Lesson> lessons;

  Chapter({
    required this.id,
    required this.title,
    required this.lessons,
  });

  factory Chapter.fromJson(Map<String, dynamic> json) {
    return Chapter(
      id: json['id'],
      title: json['title'],
      lessons: (json['lessons'] as List<dynamic>)
          .map((lessonJson) => Lesson.fromJson(lessonJson))
          .toList(),
    );
  }
}

class Lesson {
  final int id;
  final int chapterId;
  final String title;
  final String description;
  final int isSeen;
  final int totalMinutes;
  final int isQuiz;
  final dynamic quizId;
  final int questionsCount;

  Lesson({
    required this.id,
    required this.chapterId,
    required this.title,
    required this.description,
    required this.isSeen,
    required this.totalMinutes,
    required this.isQuiz,
    required this.quizId,
    required this.questionsCount,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      id: json['id'],
      chapterId: json['chapter_id'],
      title: json['title'],
      description: json['description'],
      isSeen: json['is_seen'],
      totalMinutes: json['total_minutes'],
      isQuiz: json['is_quiz'],
      quizId: json['quiz_id'],
      questionsCount: json['questions_count'],
    );
  }
}

class Instructor {
  final int id;
  final String name;
  final String? lastName;
  final String image;
  final String bio;
  final int studentCount;
  final List<dynamic> courses;
  final int coursesCount;

  Instructor({
    required this.id,
    required this.name,
    required this.lastName,
    required this.image,
    required this.bio,
    required this.studentCount,
    required this.courses,
    required this.coursesCount,
  });

  factory Instructor.fromJson(Map<String, dynamic> json) {
    return Instructor(
      id: json['id'],
      name: json['name'],
      lastName: json['last_name'],
      image: json['image'],
      bio: json['bio'],
      studentCount: json['student_count'],
      courses: json['courses'],
      coursesCount: json['courses_count'],
    );
  }
}

class Enrollment {
  final bool isBought;
  final DateTime? expiredAt;
  final DateTime? boughtAt;
  final bool canAccess;

  Enrollment({
    required this.isBought,
    required this.expiredAt,
    required this.boughtAt,
    required this.canAccess,
  });

  factory Enrollment.fromJson(Map<String, dynamic> json) {
    return Enrollment(
      isBought: json['is_bought'] == 1,
      expiredAt: json['expired_at'] != null
          ? DateTime.parse(json['expired_at'])
          : null,
      boughtAt:
          json['bought_at'] != null ? DateTime.parse(json['bought_at']) : null,
      canAccess: json['can_access'] == 1,
    );
  }
}
