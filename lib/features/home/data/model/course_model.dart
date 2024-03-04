class CourseModel {
  num? id;
  String? title;
  num? price;
  String? image;
  num? rate;
  num? rateCount;
  num? inWishlist;
  String? type;
  List<InstructorModel>? instructors;

  CourseModel({
    this.id,
    this.title,
    this.price,
    this.image,
    this.rate,
    this.rateCount,
    this.inWishlist,
    this.type,
    this.instructors,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['data']['id'],
      title: json['data']['title'],
      price: json['data']['price'],
      image: json['data']['image'],
      rate: json['data']['rate'],
      rateCount: json['data']['rate_count'],
      inWishlist: json['data']['in_wishlist'],
      type: json['data']['type'],
      instructors: json['data']['instructors'] != null
          ? List<InstructorModel>.from(json['data']['instructors'].map(
              (instructor) => InstructorModel.fromJson(instructor),
            ))
          : [],
    );
  }
}

class InstructorModel {
  num? id;
  String? name;
  String? lastName;
  String? image;
  String? bio;
  num? studentCount;
  List<CourseModel>? courses;
  num? coursesCount;

  InstructorModel({
    this.id,
    this.name,
    this.lastName,
    this.image,
    this.bio,
    this.studentCount,
    this.courses,
    this.coursesCount,
  });

  factory InstructorModel.fromJson(Map<String, dynamic> json) {
    return InstructorModel(
      id: json['id'],
      name: json['name'],
      lastName: json['last_name'],
      image: json['image'],
      bio: json['bio'],
      studentCount: json['student_count'],
      courses: json['courses'] != null
          ? List<CourseModel>.from(
              json['courses'].map((course) => CourseModel.fromJson(course)))
          : [],
      coursesCount: json['courses_count'],
    );
  }
}
