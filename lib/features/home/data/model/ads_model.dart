class DartModel {
  List<AdsModel> data;

  DartModel({required this.data});

  factory DartModel.fromJson(Map<String, dynamic> json) {
    return DartModel(
      data: List<AdsModel>.from(
          json['data'].map((ads) => AdsModel.fromJson(ads))),
    );
  }
}

class AdsModel {
  int id;
  String title;
  int courseId;
  String image;
  int price;

  AdsModel({
    required this.id,
    required this.title,
    required this.courseId,
    required this.image,
    required this.price,
  });

  factory AdsModel.fromJson(Map<String, dynamic> json) {
    return AdsModel(
      id: json['id'],
      title: json['title'],
      courseId: json['course_id'],
      image: json['image'],
      price: json['price'],
    );
  }
}
