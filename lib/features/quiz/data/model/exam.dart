class Exam {
  final int id;
  final String title;

  Exam({ this.id=0, this.title = ''});

  Exam fromJson(Map<String, dynamic> json) {
    return Exam(id: json['id'], title: json['title']);
  }
}
