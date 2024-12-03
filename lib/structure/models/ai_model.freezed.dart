// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AiModel _$AiModelFromJson(Map<String, dynamic> json) {
  return _AiModel.fromJson(json);
}

/// @nodoc
mixin _$AiModel {
  @HiveField(0)
  String get name => throw _privateConstructorUsedError;
  @HiveField(1)
  String get model => throw _privateConstructorUsedError;
  @HiveField(2)
  int get size => throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: "modified_at")
  DateTime get modifiedAt => throw _privateConstructorUsedError;

  /// Serializes this AiModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AiModelCopyWith<AiModel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiModelCopyWith<$Res> {
  factory $AiModelCopyWith(AiModel value, $Res Function(AiModel) then) =
      _$AiModelCopyWithImpl<$Res, AiModel>;
  @useResult
  $Res call(
      {@HiveField(0) String name,
      @HiveField(1) String model,
      @HiveField(2) int size,
      @HiveField(3) @JsonKey(name: "modified_at") DateTime modifiedAt});
}

/// @nodoc
class _$AiModelCopyWithImpl<$Res, $Val extends AiModel>
    implements $AiModelCopyWith<$Res> {
  _$AiModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AiModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? model = null,
    Object? size = null,
    Object? modifiedAt = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      modifiedAt: null == modifiedAt
          ? _value.modifiedAt
          : modifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AiModelImplCopyWith<$Res> implements $AiModelCopyWith<$Res> {
  factory _$$AiModelImplCopyWith(
          _$AiModelImpl value, $Res Function(_$AiModelImpl) then) =
      __$$AiModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String name,
      @HiveField(1) String model,
      @HiveField(2) int size,
      @HiveField(3) @JsonKey(name: "modified_at") DateTime modifiedAt});
}

/// @nodoc
class __$$AiModelImplCopyWithImpl<$Res>
    extends _$AiModelCopyWithImpl<$Res, _$AiModelImpl>
    implements _$$AiModelImplCopyWith<$Res> {
  __$$AiModelImplCopyWithImpl(
      _$AiModelImpl _value, $Res Function(_$AiModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AiModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? model = null,
    Object? size = null,
    Object? modifiedAt = null,
  }) {
    return _then(_$AiModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      modifiedAt: null == modifiedAt
          ? _value.modifiedAt
          : modifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AiModelImpl extends _AiModel {
  const _$AiModelImpl(
      {@HiveField(0) this.name = "",
      @HiveField(1) this.model = "",
      @HiveField(2) this.size = 0,
      @HiveField(3) @JsonKey(name: "modified_at") required this.modifiedAt})
      : super._();

  factory _$AiModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AiModelImplFromJson(json);

  @override
  @JsonKey()
  @HiveField(0)
  final String name;
  @override
  @JsonKey()
  @HiveField(1)
  final String model;
  @override
  @JsonKey()
  @HiveField(2)
  final int size;
  @override
  @HiveField(3)
  @JsonKey(name: "modified_at")
  final DateTime modifiedAt;

  @override
  String toString() {
    return 'AiModel(name: $name, model: $model, size: $size, modifiedAt: $modifiedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.modifiedAt, modifiedAt) ||
                other.modifiedAt == modifiedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, model, size, modifiedAt);

  /// Create a copy of AiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AiModelImplCopyWith<_$AiModelImpl> get copyWith =>
      __$$AiModelImplCopyWithImpl<_$AiModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AiModelImplToJson(
      this,
    );
  }
}

abstract class _AiModel extends AiModel {
  const factory _AiModel(
      {@HiveField(0) final String name,
      @HiveField(1) final String model,
      @HiveField(2) final int size,
      @HiveField(3)
      @JsonKey(name: "modified_at")
      required final DateTime modifiedAt}) = _$AiModelImpl;
  const _AiModel._() : super._();

  factory _AiModel.fromJson(Map<String, dynamic> json) = _$AiModelImpl.fromJson;

  @override
  @HiveField(0)
  String get name;
  @override
  @HiveField(1)
  String get model;
  @override
  @HiveField(2)
  int get size;
  @override
  @HiveField(3)
  @JsonKey(name: "modified_at")
  DateTime get modifiedAt;

  /// Create a copy of AiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AiModelImplCopyWith<_$AiModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
