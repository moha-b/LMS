class User {
  final int id;
  final String username;
  final String email;
  final String mobile;
  final String created;
  final String image;
  final String accessToken;
  // Private constructor
  User._({
    required this.id,
    required this.username,
    required this.email,
    required this.mobile,
    required this.created,
    required this.image,
    required this.accessToken,
  }) ;

  static User? _instance;

  factory User.fromJson(Map<String, dynamic> json) {
    if (_instance == null) {
      _instance = User._(
        id: json['data']['id'],
        username: json['data']['username'],
        email: json['data']['email'],
        mobile: json['data']['mobile'],
        created: json['data']['created'],
        image: json['data']['image'],
        accessToken: json['data']['access_token'],
      );
    }
    return _instance!;
  }

  static User? getInstance() {
    return _instance;
  }
}
