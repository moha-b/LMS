class SubmitExam {
  final int id;
  final Map options;
  final DateTime startDate;
  final DateTime endDate;

  SubmitExam(
      {required this.id,
      required this.startDate,
      required this.endDate,
      required this.options});
}
