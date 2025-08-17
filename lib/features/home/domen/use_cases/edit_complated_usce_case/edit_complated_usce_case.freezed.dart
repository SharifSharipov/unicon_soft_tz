// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_complated_usce_case.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

EditCompletedParams _$EditCompletedParamsFromJson(Map<String, dynamic> json) {
  return _EditCompletedParams.fromJson(json);
}

/// @nodoc
mixin _$EditCompletedParams {
  int get id => throw _privateConstructorUsedError;
  TodoModel get todoModel => throw _privateConstructorUsedError;

  /// Serializes this EditCompletedParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EditCompletedParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EditCompletedParamsCopyWith<EditCompletedParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditCompletedParamsCopyWith<$Res> {
  factory $EditCompletedParamsCopyWith(
    EditCompletedParams value,
    $Res Function(EditCompletedParams) then,
  ) = _$EditCompletedParamsCopyWithImpl<$Res, EditCompletedParams>;
  @useResult
  $Res call({int id, TodoModel todoModel});
}

/// @nodoc
class _$EditCompletedParamsCopyWithImpl<$Res, $Val extends EditCompletedParams>
    implements $EditCompletedParamsCopyWith<$Res> {
  _$EditCompletedParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EditCompletedParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? todoModel = null}) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
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
abstract class _$$EditCompletedParamsImplCopyWith<$Res>
    implements $EditCompletedParamsCopyWith<$Res> {
  factory _$$EditCompletedParamsImplCopyWith(
    _$EditCompletedParamsImpl value,
    $Res Function(_$EditCompletedParamsImpl) then,
  ) = __$$EditCompletedParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, TodoModel todoModel});
}

/// @nodoc
class __$$EditCompletedParamsImplCopyWithImpl<$Res>
    extends _$EditCompletedParamsCopyWithImpl<$Res, _$EditCompletedParamsImpl>
    implements _$$EditCompletedParamsImplCopyWith<$Res> {
  __$$EditCompletedParamsImplCopyWithImpl(
    _$EditCompletedParamsImpl _value,
    $Res Function(_$EditCompletedParamsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EditCompletedParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? todoModel = null}) {
    return _then(
      _$EditCompletedParamsImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
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
class _$EditCompletedParamsImpl implements _EditCompletedParams {
  const _$EditCompletedParamsImpl({required this.id, required this.todoModel});

  factory _$EditCompletedParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$EditCompletedParamsImplFromJson(json);

  @override
  final int id;
  @override
  final TodoModel todoModel;

  @override
  String toString() {
    return 'EditCompletedParams(id: $id, todoModel: $todoModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditCompletedParamsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.todoModel, todoModel) ||
                other.todoModel == todoModel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, todoModel);

  /// Create a copy of EditCompletedParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EditCompletedParamsImplCopyWith<_$EditCompletedParamsImpl> get copyWith =>
      __$$EditCompletedParamsImplCopyWithImpl<_$EditCompletedParamsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$EditCompletedParamsImplToJson(this);
  }
}

abstract class _EditCompletedParams implements EditCompletedParams {
  const factory _EditCompletedParams({
    required final int id,
    required final TodoModel todoModel,
  }) = _$EditCompletedParamsImpl;

  factory _EditCompletedParams.fromJson(Map<String, dynamic> json) =
      _$EditCompletedParamsImpl.fromJson;

  @override
  int get id;
  @override
  TodoModel get todoModel;

  /// Create a copy of EditCompletedParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EditCompletedParamsImplCopyWith<_$EditCompletedParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
