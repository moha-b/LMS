import 'instructor_model.dart';

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
