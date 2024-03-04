import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/navigation/navigation.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  final PageController pageController = PageController();
  int currentPage = 1;
  static QuizCubit get instance =>
      BlocProvider.of(NavigationHelper.navigatorKey.currentContext!);
  QuizCubit() : super(QuizInitial());

  void onPageChanged(int value) {
    currentPage = value;
  }

  void nextPage() {
    if (currentPage < 10) {
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
