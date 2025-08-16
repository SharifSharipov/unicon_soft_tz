part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
   const factory HomeState({
    @Default(UnknownFailure()) Failure failure,
    @Default(Status.initial) Status status,
    @Default([]) List<TodoEntity> todos,
    
  }) = _HomeState;
}
