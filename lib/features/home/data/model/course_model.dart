class CoursesModel {
  final List<Course> courses;

  CoursesModel({
    required this.courses,
  });

  factory CoursesModel.fromJson(Map<String, dynamic> json) {
    return CoursesModel(
      courses: List<Course>.from(
          json['data'].map((course) => Course.fromJson(course))),
    );
  }
}

class Course {
  final int id;
  final String title;
  final double price;
  final String image;
  final double rate;
  final int rateCount;
  final int inWishlist;
  final String type;
  final List<Instructor> instructors;

  Course({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.rate,
    required this.rateCount,
    required this.inWishlist,
    required this.type,
    required this.instructors,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      image: json['image'],
      rate: json['rate'].toDouble(),
      rateCount: json['rate_count'],
      inWishlist: json['in_wishlist'],
      type: json['type'],
      instructors: json['instructors'] != null
          ? List<Instructor>.from(json['instructors']
              .map((instructor) => Instructor.fromJson(instructor)))
          : [],
    );
  }
}

class Instructor {
  final int id;
  final String name;
  final String? lastName;
  final String image;
  final String? bio;
  final int studentCount;
  final List<Course> courses;
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
      courses: json['courses'] != null
          ? List<Course>.from(
              json['courses'].map((course) => Course.fromJson(course)))
          : [],
      coursesCount: json['courses_count'],
    );
  }
}
