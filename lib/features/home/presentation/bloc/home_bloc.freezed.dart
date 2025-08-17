// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$HomeState {
  Failure get failure => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  List<TodoEntity> get todos => throw _privateConstructorUsedError;
  bool get isDeleting => throw _privateConstructorUsedError;
  TodoEntity? get todo => throw _privateConstructorUsedError;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call({
    Failure failure,
    Status status,
    List<TodoEntity> todos,
    bool isDeleting,
    TodoEntity? todo,
  });
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
    Object? status = null,
    Object? todos = null,
    Object? isDeleting = null,
    Object? todo = freezed,
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
            todos: null == todos
                ? _value.todos
                : todos // ignore: cast_nullable_to_non_nullable
                      as List<TodoEntity>,
            isDeleting: null == isDeleting
                ? _value.isDeleting
                : isDeleting // ignore: cast_nullable_to_non_nullable
                      as bool,
            todo: freezed == todo
                ? _value.todo
                : todo // ignore: cast_nullable_to_non_nullable
                      as TodoEntity?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
    _$HomeStateImpl value,
    $Res Function(_$HomeStateImpl) then,
  ) = __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Failure failure,
    Status status,
    List<TodoEntity> todos,
    bool isDeleting,
    TodoEntity? todo,
  });
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
    _$HomeStateImpl _value,
    $Res Function(_$HomeStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
    Object? status = null,
    Object? todos = null,
    Object? isDeleting = null,
    Object? todo = freezed,
  }) {
    return _then(
      _$HomeStateImpl(
        failure: null == failure
            ? _value.failure
            : failure // ignore: cast_nullable_to_non_nullable
                  as Failure,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as Status,
        todos: null == todos
            ? _value._todos
            : todos // ignore: cast_nullable_to_non_nullable
                  as List<TodoEntity>,
        isDeleting: null == isDeleting
            ? _value.isDeleting
            : isDeleting // ignore: cast_nullable_to_non_nullable
                  as bool,
        todo: freezed == todo
            ? _value.todo
            : todo // ignore: cast_nullable_to_non_nullable
                  as TodoEntity?,
      ),
    );
  }
}

/// @nodoc

class _$HomeStateImpl implements _HomeState {
  const _$HomeStateImpl({
    this.failure = const UnknownFailure(),
    this.status = Status.initial,
    final List<TodoEntity> todos = const <TodoEntity>[],
    this.isDeleting = false,
    this.todo,
  }) : _todos = todos;

  @override
  @JsonKey()
  final Failure failure;
  @override
  @JsonKey()
  final Status status;
  final List<TodoEntity> _todos;
  @override
  @JsonKey()
  List<TodoEntity> get todos {
    if (_todos is EqualUnmodifiableListView) return _todos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_todos);
  }

  @override
  @JsonKey()
  final bool isDeleting;
  @override
  final TodoEntity? todo;

  @override
  String toString() {
    return 'HomeState(failure: $failure, status: $status, todos: $todos, isDeleting: $isDeleting, todo: $todo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(other.failure, failure) || other.failure == failure) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._todos, _todos) &&
            (identical(other.isDeleting, isDeleting) ||
                other.isDeleting == isDeleting) &&
            (identical(other.todo, todo) || other.todo == todo));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    failure,
    status,
    const DeepCollectionEquality().hash(_todos),
    isDeleting,
    todo,
  );

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState({
    final Failure failure,
    final Status status,
    final List<TodoEntity> todos,
    final bool isDeleting,
    final TodoEntity? todo,
  }) = _$HomeStateImpl;

  @override
  Failure get failure;
  @override
  Status get status;
  @override
  List<TodoEntity> get todos;
  @override
  bool get isDeleting;
  @override
  TodoEntity? get todo;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
