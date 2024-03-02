class UserModel {
  final int? id;
  final String? username;
  final String? email;
  final String? mobile;
  final String? created;
  final String? image;
  final String? accessToken;

  UserModel({
    this.id,
    this.username,
    this.email,
    this.mobile,
    this.created,
    this.image,
    this.accessToken,
  });

  static UserModel? instance;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    instance ??= UserModel(
      id: json['data']['id'],
      username: json['data']['username'],
      email: json['data']['email'],
      mobile: json['data']['mobile'],
      created: json['data']['created'],
      image: json['data']['image'],
      accessToken: json['data']['access_token'],
    );
    return instance!;
  }

  static UserModel? getInstance() => instance;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'mobile': mobile,
      'created': created,
      'image': image,
      'access_token': accessToken,
    };
  }
}
