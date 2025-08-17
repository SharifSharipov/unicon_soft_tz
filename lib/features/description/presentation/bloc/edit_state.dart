part of 'edit_bloc.dart';
@freezed
class EditState with _$EditState {
  const factory EditState({
    @Default(UnknownFailure()) Failure failure,
    @Default(Status.initial) Status status,
    TodoModel? todoModel,
  }) = _EditState;
}