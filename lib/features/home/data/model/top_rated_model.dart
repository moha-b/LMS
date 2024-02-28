class Data {
  int id;
  String title;
  String courseCategory;
  String image;
  int price;
  double rate;
  int chaptersCount;

  Data({
    required this.id,
    required this.title,
    required this.courseCategory,
    required this.image,
    required this.price,
    required this.rate,
    required this.chaptersCount,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
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

class TopRatedCoursesModel {
  List<Data> courses;

  TopRatedCoursesModel({required this.courses});

  factory TopRatedCoursesModel.fromJson(Map<String, dynamic> json) {
    return TopRatedCoursesModel(
      courses: (json['data'] as List<dynamic>)
          .map((item) => Data.fromJson(item))
          .toList(),
    );
  }
}
