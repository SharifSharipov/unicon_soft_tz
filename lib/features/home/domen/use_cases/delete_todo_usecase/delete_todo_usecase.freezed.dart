// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_todo_usecase.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$DeleteTodoParams {
  int get id => throw _privateConstructorUsedError;

  /// Create a copy of DeleteTodoParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeleteTodoParamsCopyWith<DeleteTodoParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteTodoParamsCopyWith<$Res> {
  factory $DeleteTodoParamsCopyWith(
    DeleteTodoParams value,
    $Res Function(DeleteTodoParams) then,
  ) = _$DeleteTodoParamsCopyWithImpl<$Res, DeleteTodoParams>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$DeleteTodoParamsCopyWithImpl<$Res, $Val extends DeleteTodoParams>
    implements $DeleteTodoParamsCopyWith<$Res> {
  _$DeleteTodoParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeleteTodoParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null}) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DeleteTodoParamsImplCopyWith<$Res>
    implements $DeleteTodoParamsCopyWith<$Res> {
  factory _$$DeleteTodoParamsImplCopyWith(
    _$DeleteTodoParamsImpl value,
    $Res Function(_$DeleteTodoParamsImpl) then,
  ) = __$$DeleteTodoParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$DeleteTodoParamsImplCopyWithImpl<$Res>
    extends _$DeleteTodoParamsCopyWithImpl<$Res, _$DeleteTodoParamsImpl>
    implements _$$DeleteTodoParamsImplCopyWith<$Res> {
  __$$DeleteTodoParamsImplCopyWithImpl(
    _$DeleteTodoParamsImpl _value,
    $Res Function(_$DeleteTodoParamsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DeleteTodoParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null}) {
    return _then(
      _$DeleteTodoParamsImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$DeleteTodoParamsImpl implements _DeleteTodoParams {
  const _$DeleteTodoParamsImpl({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'DeleteTodoParams(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteTodoParamsImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of DeleteTodoParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteTodoParamsImplCopyWith<_$DeleteTodoParamsImpl> get copyWith =>
      __$$DeleteTodoParamsImplCopyWithImpl<_$DeleteTodoParamsImpl>(
        this,
        _$identity,
      );
}

abstract class _DeleteTodoParams implements DeleteTodoParams {
  const factory _DeleteTodoParams({required final int id}) =
      _$DeleteTodoParamsImpl;

  @override
  int get id;

  /// Create a copy of DeleteTodoParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteTodoParamsImplCopyWith<_$DeleteTodoParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
