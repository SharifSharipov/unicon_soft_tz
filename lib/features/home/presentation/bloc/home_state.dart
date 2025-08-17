part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
   const factory HomeState({
    @Default(UnknownFailure()) Failure failure,
    @Default(Status.initial) Status status,
    @Default(<TodoEntity>[]) List<TodoEntity> todos,
    @Default(false) bool isDeleting,
    TodoEntity? todo,
  }) = _HomeState;
}
