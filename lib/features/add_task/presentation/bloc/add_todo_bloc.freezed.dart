// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_todo_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AddTodoState {
  Failure get failure => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  TodoModel? get todoModel => throw _privateConstructorUsedError;

  /// Create a copy of AddTodoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddTodoStateCopyWith<AddTodoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddTodoStateCopyWith<$Res> {
  factory $AddTodoStateCopyWith(
    AddTodoState value,
    $Res Function(AddTodoState) then,
  ) = _$AddTodoStateCopyWithImpl<$Res, AddTodoState>;
  @useResult
  $Res call({Failure failure, Status status, TodoModel? todoModel});
}

/// @nodoc
class _$AddTodoStateCopyWithImpl<$Res, $Val extends AddTodoState>
    implements $AddTodoStateCopyWith<$Res> {
  _$AddTodoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddTodoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
    Object? status = null,
    Object? todoModel = freezed,
  }) {
    return _then(
      _value.copyWith(
            failure: null == failure
                ? _value.failure
                : failure // ignore: cast_nullable_to_non_nullable
                      as Failure,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as Status,
            todoModel: freezed == todoModel
                ? _value.todoModel
                : todoModel // ignore: cast_nullable_to_non_nullable
                      as TodoModel?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AddTodoStateImplCopyWith<$Res>
    implements $AddTodoStateCopyWith<$Res> {
  factory _$$AddTodoStateImplCopyWith(
    _$AddTodoStateImpl value,
    $Res Function(_$AddTodoStateImpl) then,
  ) = __$$AddTodoStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Failure failure, Status status, TodoModel? todoModel});
}

/// @nodoc
class __$$AddTodoStateImplCopyWithImpl<$Res>
    extends _$AddTodoStateCopyWithImpl<$Res, _$AddTodoStateImpl>
    implements _$$AddTodoStateImplCopyWith<$Res> {
  __$$AddTodoStateImplCopyWithImpl(
    _$AddTodoStateImpl _value,
    $Res Function(_$AddTodoStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AddTodoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
    Object? status = null,
    Object? todoModel = freezed,
  }) {
    return _then(
      _$AddTodoStateImpl(
        failure: null == failure
            ? _value.failure
            : failure // ignore: cast_nullable_to_non_nullable
                  as Failure,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as Status,
        todoModel: freezed == todoModel
            ? _value.todoModel
            : todoModel // ignore: cast_nullable_to_non_nullable
                  as TodoModel?,
      ),
    );
  }
}

/// @nodoc

class _$AddTodoStateImpl implements _AddTodoState {
  const _$AddTodoStateImpl({
    this.failure = const UnknownFailure(),
    this.status = Status.initial,
    this.todoModel,
  });

  @override
  @JsonKey()
  final Failure failure;
  @override
  @JsonKey()
  final Status status;
  @override
  final TodoModel? todoModel;

  @override
  String toString() {
    return 'AddTodoState(failure: $failure, status: $status, todoModel: $todoModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddTodoStateImpl &&
            (identical(other.failure, failure) || other.failure == failure) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.todoModel, todoModel) ||
                other.todoModel == todoModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure, status, todoModel);

  /// Create a copy of AddTodoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddTodoStateImplCopyWith<_$AddTodoStateImpl> get copyWith =>
      __$$AddTodoStateImplCopyWithImpl<_$AddTodoStateImpl>(this, _$identity);
}

abstract class _AddTodoState implements AddTodoState {
  const factory _AddTodoState({
    final Failure failure,
    final Status status,
    final TodoModel? todoModel,
  }) = _$AddTodoStateImpl;

  @override
  Failure get failure;
  @override
  Status get status;
  @override
  TodoModel? get todoModel;

  /// Create a copy of AddTodoState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddTodoStateImplCopyWith<_$AddTodoStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
