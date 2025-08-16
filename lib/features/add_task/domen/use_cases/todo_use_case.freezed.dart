// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_use_case.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TodoModelParams _$TodoModelParamsFromJson(Map<String, dynamic> json) {
  return _TodoModelParams.fromJson(json);
}

/// @nodoc
mixin _$TodoModelParams {
  TodoModel get todoModel => throw _privateConstructorUsedError;

  /// Serializes this TodoModelParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TodoModelParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TodoModelParamsCopyWith<TodoModelParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoModelParamsCopyWith<$Res> {
  factory $TodoModelParamsCopyWith(
    TodoModelParams value,
    $Res Function(TodoModelParams) then,
  ) = _$TodoModelParamsCopyWithImpl<$Res, TodoModelParams>;
  @useResult
  $Res call({TodoModel todoModel});
}

/// @nodoc
class _$TodoModelParamsCopyWithImpl<$Res, $Val extends TodoModelParams>
    implements $TodoModelParamsCopyWith<$Res> {
  _$TodoModelParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TodoModelParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? todoModel = null}) {
    return _then(
      _value.copyWith(
            todoModel: null == todoModel
                ? _value.todoModel
                : todoModel // ignore: cast_nullable_to_non_nullable
                      as TodoModel,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TodoModelParamsImplCopyWith<$Res>
    implements $TodoModelParamsCopyWith<$Res> {
  factory _$$TodoModelParamsImplCopyWith(
    _$TodoModelParamsImpl value,
    $Res Function(_$TodoModelParamsImpl) then,
  ) = __$$TodoModelParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TodoModel todoModel});
}

/// @nodoc
class __$$TodoModelParamsImplCopyWithImpl<$Res>
    extends _$TodoModelParamsCopyWithImpl<$Res, _$TodoModelParamsImpl>
    implements _$$TodoModelParamsImplCopyWith<$Res> {
  __$$TodoModelParamsImplCopyWithImpl(
    _$TodoModelParamsImpl _value,
    $Res Function(_$TodoModelParamsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TodoModelParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? todoModel = null}) {
    return _then(
      _$TodoModelParamsImpl(
        todoModel: null == todoModel
            ? _value.todoModel
            : todoModel // ignore: cast_nullable_to_non_nullable
                  as TodoModel,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TodoModelParamsImpl implements _TodoModelParams {
  const _$TodoModelParamsImpl({required this.todoModel});

  factory _$TodoModelParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$TodoModelParamsImplFromJson(json);

  @override
  final TodoModel todoModel;

  @override
  String toString() {
    return 'TodoModelParams(todoModel: $todoModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoModelParamsImpl &&
            (identical(other.todoModel, todoModel) ||
                other.todoModel == todoModel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, todoModel);

  /// Create a copy of TodoModelParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoModelParamsImplCopyWith<_$TodoModelParamsImpl> get copyWith =>
      __$$TodoModelParamsImplCopyWithImpl<_$TodoModelParamsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TodoModelParamsImplToJson(this);
  }
}

abstract class _TodoModelParams implements TodoModelParams {
  const factory _TodoModelParams({required final TodoModel todoModel}) =
      _$TodoModelParamsImpl;

  factory _TodoModelParams.fromJson(Map<String, dynamic> json) =
      _$TodoModelParamsImpl.fromJson;

  @override
  TodoModel get todoModel;

  /// Create a copy of TodoModelParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TodoModelParamsImplCopyWith<_$TodoModelParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
