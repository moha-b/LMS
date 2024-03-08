import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/core/navigation/navigation.dart';

part 'quiz_buttons_state.dart';

class QuizButtonsCubit extends Cubit<QuizButtonsState> {
  QuizButtonsCubit() : super(QuizButtonsInitial());

  final PageController pageController = PageController();
  int currentPage = 1;

  static QuizButtonsCubit get instance =>
      BlocProvider.of(NavigationHelper.navigatorKey.currentContext!);

  void onPageChanged(int value) {
    currentPage = value;
  }

  void nextPage(max) {
    if (currentPage < max) {
      currentPage++;
      emit(QuizNextPage());
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
    print(currentPage);
  }

  void previousPage() {
    if (currentPage > 1) {
      currentPage--;
      emit(QuizPreviousPage());
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
    print(currentPage);
  }
}
