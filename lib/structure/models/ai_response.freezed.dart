// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AiResponse _$AiResponseFromJson(Map<String, dynamic> json) {
  return _AiResponse.fromJson(json);
}

/// @nodoc
mixin _$AiResponse {
  String get name => throw _privateConstructorUsedError;
  String get response => throw _privateConstructorUsedError;
  List<int> get context => throw _privateConstructorUsedError;
  bool get isUser => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this AiResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AiResponseCopyWith<AiResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiResponseCopyWith<$Res> {
  factory $AiResponseCopyWith(
          AiResponse value, $Res Function(AiResponse) then) =
      _$AiResponseCopyWithImpl<$Res, AiResponse>;
  @useResult
  $Res call(
      {String name,
      String response,
      List<int> context,
      bool isUser,
      @JsonKey(name: "created_at") DateTime createdAt});
}

/// @nodoc
class _$AiResponseCopyWithImpl<$Res, $Val extends AiResponse>
    implements $AiResponseCopyWith<$Res> {
  _$AiResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? response = null,
    Object? context = null,
    Object? isUser = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String,
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as List<int>,
      isUser: null == isUser
          ? _value.isUser
          : isUser // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AiResponseImplCopyWith<$Res>
    implements $AiResponseCopyWith<$Res> {
  factory _$$AiResponseImplCopyWith(
          _$AiResponseImpl value, $Res Function(_$AiResponseImpl) then) =
      __$$AiResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String response,
      List<int> context,
      bool isUser,
      @JsonKey(name: "created_at") DateTime createdAt});
}

/// @nodoc
class __$$AiResponseImplCopyWithImpl<$Res>
    extends _$AiResponseCopyWithImpl<$Res, _$AiResponseImpl>
    implements _$$AiResponseImplCopyWith<$Res> {
  __$$AiResponseImplCopyWithImpl(
      _$AiResponseImpl _value, $Res Function(_$AiResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of AiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? response = null,
    Object? context = null,
    Object? isUser = null,
    Object? createdAt = null,
  }) {
    return _then(_$AiResponseImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String,
      context: null == context
          ? _value._context
          : context // ignore: cast_nullable_to_non_nullable
              as List<int>,
      isUser: null == isUser
          ? _value.isUser
          : isUser // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AiResponseImpl extends _AiResponse {
  const _$AiResponseImpl(
      {this.name = "",
      this.response = "",
      final List<int> context = const [],
      this.isUser = false,
      @JsonKey(name: "created_at") required this.createdAt})
      : _context = context,
        super._();

  factory _$AiResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AiResponseImplFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String response;
  final List<int> _context;
  @override
  @JsonKey()
  List<int> get context {
    if (_context is EqualUnmodifiableListView) return _context;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_context);
  }

  @override
  @JsonKey()
  final bool isUser;
  @override
  @JsonKey(name: "created_at")
  final DateTime createdAt;

  @override
  String toString() {
    return 'AiResponse(name: $name, response: $response, context: $context, isUser: $isUser, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiResponseImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.response, response) ||
                other.response == response) &&
            const DeepCollectionEquality().equals(other._context, _context) &&
            (identical(other.isUser, isUser) || other.isUser == isUser) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, response,
      const DeepCollectionEquality().hash(_context), isUser, createdAt);

  /// Create a copy of AiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AiResponseImplCopyWith<_$AiResponseImpl> get copyWith =>
      __$$AiResponseImplCopyWithImpl<_$AiResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AiResponseImplToJson(
      this,
    );
  }
}

abstract class _AiResponse extends AiResponse {
  const factory _AiResponse(
          {final String name,
          final String response,
          final List<int> context,
          final bool isUser,
          @JsonKey(name: "created_at") required final DateTime createdAt}) =
      _$AiResponseImpl;
  const _AiResponse._() : super._();

  factory _AiResponse.fromJson(Map<String, dynamic> json) =
      _$AiResponseImpl.fromJson;

  @override
  String get name;
  @override
  String get response;
  @override
  List<int> get context;
  @override
  bool get isUser;
  @override
  @JsonKey(name: "created_at")
  DateTime get createdAt;

  /// Create a copy of AiResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AiResponseImplCopyWith<_$AiResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
