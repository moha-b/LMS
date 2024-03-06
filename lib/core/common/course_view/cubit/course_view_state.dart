part of 'course_view_cubit.dart';

@immutable
class CourseViewState extends Equatable {
  final Course? courseData;
  final List<CourseModel>? relatedCoursesData;
  final String? error;
  final RequestState courseState;
  final RequestState relatedCoursesState;

  const CourseViewState({
    this.courseData,
    this.relatedCoursesData,
    this.error,
    this.courseState = RequestState.loading,
    this.relatedCoursesState = RequestState.loading,
  });

  CourseViewState copyWith({
    Course? courseData,
    List<CourseModel>? relatedCoursesData,
    String? error,
    RequestState? courseState,
    RequestState? relatedCoursesState,
  }) {
    return CourseViewState(
      courseData: courseData ?? this.courseData,
      relatedCoursesData: relatedCoursesData ?? this.relatedCoursesData,
      error: error ?? this.error,
      courseState: courseState ?? this.courseState,
      relatedCoursesState: relatedCoursesState ?? this.relatedCoursesState,
    );
  }

  @override
  List<Object?> get props => [
        courseData,
        relatedCoursesData,
        error,
        courseState,
        relatedCoursesState,
      ];
}
