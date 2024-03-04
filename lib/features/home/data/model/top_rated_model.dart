class TopRatedCoursesModel {
  int id;
  String title;
  String courseCategory;
  String image;
  int price;
  double rate;
  int chaptersCount;

  TopRatedCoursesModel({
    required this.id,
    required this.title,
    required this.courseCategory,
    required this.image,
    required this.price,
    required this.rate,
    required this.chaptersCount,
  });

  factory TopRatedCoursesModel.fromJson(Map<String, dynamic> json) {
    return TopRatedCoursesModel(
      id: json['id'],
      title: json['title'],
      courseCategory: json['course_category'],
      image: json['image'],
      price: json['price'],
      rate: json['rate'].toDouble(),
      chaptersCount: json['chapters_count'],
    );
  }
}

class TopRatedCourses {
  List<TopRatedCoursesModel> courses;

  TopRatedCourses({required this.courses});

  factory TopRatedCourses.fromJson(Map<String, dynamic> json) {
    return TopRatedCourses(
      courses: (json['data'] as List<dynamic>)
          .map((item) => TopRatedCoursesModel.fromJson(item))
          .toList(),
    );
  }
}
