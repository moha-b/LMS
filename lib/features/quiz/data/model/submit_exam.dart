class SubmitExam {
  final int id;
  final Map options;
  final String startDate;
  final String endDate;

  SubmitExam(
      {required this.id,
      required this.startDate,
      required this.endDate,
      required this.options});

  static String getStringFromList(Set<String> set) {
    List<String> myList = set.toList();
    String text = '';
    for (int i = 0; i < set.length; i++) {
      i == 0 ? text = myList[i] : text += ',${myList[i]}';
    }
    return text;
  }
}
