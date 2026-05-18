// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'raid_participant_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RaidParticipant {

 String get userId; String get displayName; DateTime get joinedAt; String? get avatarUrl;
/// Create a copy of RaidParticipant
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RaidParticipantCopyWith<RaidParticipant> get copyWith => _$RaidParticipantCopyWithImpl<RaidParticipant>(this as RaidParticipant, _$identity);

  /// Serializes this RaidParticipant to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RaidParticipant&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.joinedAt, joinedAt) || other.joinedAt == joinedAt)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,displayName,joinedAt,avatarUrl);

@override
String toString() {
  return 'RaidParticipant(userId: $userId, displayName: $displayName, joinedAt: $joinedAt, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class $RaidParticipantCopyWith<$Res>  {
  factory $RaidParticipantCopyWith(RaidParticipant value, $Res Function(RaidParticipant) _then) = _$RaidParticipantCopyWithImpl;
@useResult
$Res call({
 String userId, String displayName, DateTime joinedAt, String? avatarUrl
});




}
/// @nodoc
class _$RaidParticipantCopyWithImpl<$Res>
    implements $RaidParticipantCopyWith<$Res> {
  _$RaidParticipantCopyWithImpl(this._self, this._then);

  final RaidParticipant _self;
  final $Res Function(RaidParticipant) _then;

/// Create a copy of RaidParticipant
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? displayName = null,Object? joinedAt = null,Object? avatarUrl = freezed,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,joinedAt: null == joinedAt ? _self.joinedAt : joinedAt // ignore: cast_nullable_to_non_nullable
as DateTime,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RaidParticipant].
extension RaidParticipantPatterns on RaidParticipant {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RaidParticipant value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RaidParticipant() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RaidParticipant value)  $default,){
final _that = this;
switch (_that) {
case _RaidParticipant():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RaidParticipant value)?  $default,){
final _that = this;
switch (_that) {
case _RaidParticipant() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  String displayName,  DateTime joinedAt,  String? avatarUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RaidParticipant() when $default != null:
return $default(_that.userId,_that.displayName,_that.joinedAt,_that.avatarUrl);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  String displayName,  DateTime joinedAt,  String? avatarUrl)  $default,) {final _that = this;
switch (_that) {
case _RaidParticipant():
return $default(_that.userId,_that.displayName,_that.joinedAt,_that.avatarUrl);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  String displayName,  DateTime joinedAt,  String? avatarUrl)?  $default,) {final _that = this;
switch (_that) {
case _RaidParticipant() when $default != null:
return $default(_that.userId,_that.displayName,_that.joinedAt,_that.avatarUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RaidParticipant implements RaidParticipant {
  const _RaidParticipant({required this.userId, required this.displayName, required this.joinedAt, this.avatarUrl});
  factory _RaidParticipant.fromJson(Map<String, dynamic> json) => _$RaidParticipantFromJson(json);

@override final  String userId;
@override final  String displayName;
@override final  DateTime joinedAt;
@override final  String? avatarUrl;

/// Create a copy of RaidParticipant
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RaidParticipantCopyWith<_RaidParticipant> get copyWith => __$RaidParticipantCopyWithImpl<_RaidParticipant>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RaidParticipantToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RaidParticipant&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.joinedAt, joinedAt) || other.joinedAt == joinedAt)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,displayName,joinedAt,avatarUrl);

@override
String toString() {
  return 'RaidParticipant(userId: $userId, displayName: $displayName, joinedAt: $joinedAt, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class _$RaidParticipantCopyWith<$Res> implements $RaidParticipantCopyWith<$Res> {
  factory _$RaidParticipantCopyWith(_RaidParticipant value, $Res Function(_RaidParticipant) _then) = __$RaidParticipantCopyWithImpl;
@override @useResult
$Res call({
 String userId, String displayName, DateTime joinedAt, String? avatarUrl
});




}
/// @nodoc
class __$RaidParticipantCopyWithImpl<$Res>
    implements _$RaidParticipantCopyWith<$Res> {
  __$RaidParticipantCopyWithImpl(this._self, this._then);

  final _RaidParticipant _self;
  final $Res Function(_RaidParticipant) _then;

/// Create a copy of RaidParticipant
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? displayName = null,Object? joinedAt = null,Object? avatarUrl = freezed,}) {
  return _then(_RaidParticipant(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,joinedAt: null == joinedAt ? _self.joinedAt : joinedAt // ignore: cast_nullable_to_non_nullable
as DateTime,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
