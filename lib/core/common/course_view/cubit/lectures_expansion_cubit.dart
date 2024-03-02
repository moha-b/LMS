import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'lectures_expansion_state.dart';

class LecturesExpansionCubit extends Cubit<LecturesExpansionState> {
  LecturesExpansionCubit(int length) : super(LecturesExpansionInitial()) {
    isExpandedList = List.filled(length, false);
  }

  bool isExpandedLectures = false;
  late List<bool> isExpandedList;

  void toggleExpandedLecturesDetails(int index) {
    isExpandedList[index] = !isExpandedList[index];
    emit(ChangeExpandedLecturesDetails());
  }

  void toggleExpandedLectures() {
    isExpandedLectures = !isExpandedLectures;
    emit(ChangeExpandedLectures());
  }
}
