class CourseItem {
  int id;
  String title;
  String typeName;
  String image;

  CourseItem({
    required this.id,
    required this.title,
    required this.typeName,
    required this.image,
  });

  factory CourseItem.fromJson(Map<String, dynamic> json) {
    return CourseItem(
      id: json['id'],
      title: json['title'],
      typeName: json['type_name'],
      image: json['image'],
    );
  }
}

class AllTracksModel {
  List<CourseItem> tracks;

  AllTracksModel({required this.tracks});

  factory AllTracksModel.fromJson(Map<String, dynamic> json) {
    return AllTracksModel(
      tracks: (json['data'] as List<dynamic>)
          .map((item) => CourseItem.fromJson(item))
          .toList(),
    );
  }
}
