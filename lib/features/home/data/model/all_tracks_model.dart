class AllTracksModel {
  int id;
  String title;
  String typeName;
  String image;

  AllTracksModel({
    required this.id,
    required this.title,
    required this.typeName,
    required this.image,
  });

  factory AllTracksModel.fromJson(Map<String, dynamic> json) {
    return AllTracksModel(
      id: json['id'],
      title: json['title'],
      typeName: json['type_name'],
      image: json['image'],
    );
  }
}

class AllTrack {
  List<AllTracksModel> tracks;

  AllTrack({required this.tracks});

  factory AllTrack.fromJson(Map<String, dynamic> json) {
    return AllTrack(
      tracks: (json['data'] as List<dynamic>)
          .map((item) => AllTracksModel.fromJson(item))
          .toList(),
    );
  }
}
