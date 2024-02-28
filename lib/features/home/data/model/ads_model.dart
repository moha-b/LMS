class AdsModel {
  List<DataItem> data;

  AdsModel({required this.data});

  factory AdsModel.fromJson(Map<String, dynamic> json) {
    return AdsModel(
      data: (json['data'] as List<dynamic>)
          .map((item) => DataItem.fromJson(item))
          .toList(),
    );
  }
}

class DataItem {
  int id;
  String title;
  int courseId;
  String image;
  int price;

  DataItem({
    required this.id,
    required this.title,
    required this.courseId,
    required this.image,
    required this.price,
  });

  factory DataItem.fromJson(Map<String, dynamic> json) {
    return DataItem(
      id: json['id'],
      title: json['title'],
      courseId: json['course_id'],
      image: json['image'],
      price: json['price'],
    );
  }
}
