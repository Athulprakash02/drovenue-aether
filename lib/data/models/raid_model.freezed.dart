// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'raid_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Raid {

 String get id; String get title; int get maxParticipants; List<String> get participantIds; bool get isActive;
/// Create a copy of Raid
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RaidCopyWith<Raid> get copyWith => _$RaidCopyWithImpl<Raid>(this as Raid, _$identity);

  /// Serializes this Raid to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Raid&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.maxParticipants, maxParticipants) || other.maxParticipants == maxParticipants)&&const DeepCollectionEquality().equals(other.participantIds, participantIds)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,maxParticipants,const DeepCollectionEquality().hash(participantIds),isActive);

@override
String toString() {
  return 'Raid(id: $id, title: $title, maxParticipants: $maxParticipants, participantIds: $participantIds, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $RaidCopyWith<$Res>  {
  factory $RaidCopyWith(Raid value, $Res Function(Raid) _then) = _$RaidCopyWithImpl;
@useResult
$Res call({
 String id, String title, int maxParticipants, List<String> participantIds, bool isActive
});




}
/// @nodoc
class _$RaidCopyWithImpl<$Res>
    implements $RaidCopyWith<$Res> {
  _$RaidCopyWithImpl(this._self, this._then);

  final Raid _self;
  final $Res Function(Raid) _then;

/// Create a copy of Raid
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? maxParticipants = null,Object? participantIds = null,Object? isActive = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,maxParticipants: null == maxParticipants ? _self.maxParticipants : maxParticipants // ignore: cast_nullable_to_non_nullable
as int,participantIds: null == participantIds ? _self.participantIds : participantIds // ignore: cast_nullable_to_non_nullable
as List<String>,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Raid].
extension RaidPatterns on Raid {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Raid value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Raid() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Raid value)  $default,){
final _that = this;
switch (_that) {
case _Raid():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Raid value)?  $default,){
final _that = this;
switch (_that) {
case _Raid() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  int maxParticipants,  List<String> participantIds,  bool isActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Raid() when $default != null:
return $default(_that.id,_that.title,_that.maxParticipants,_that.participantIds,_that.isActive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  int maxParticipants,  List<String> participantIds,  bool isActive)  $default,) {final _that = this;
switch (_that) {
case _Raid():
return $default(_that.id,_that.title,_that.maxParticipants,_that.participantIds,_that.isActive);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  int maxParticipants,  List<String> participantIds,  bool isActive)?  $default,) {final _that = this;
switch (_that) {
case _Raid() when $default != null:
return $default(_that.id,_that.title,_that.maxParticipants,_that.participantIds,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Raid implements Raid {
  const _Raid({required this.id, required this.title, required this.maxParticipants, required final  List<String> participantIds, required this.isActive}): _participantIds = participantIds;
  factory _Raid.fromJson(Map<String, dynamic> json) => _$RaidFromJson(json);

@override final  String id;
@override final  String title;
@override final  int maxParticipants;
 final  List<String> _participantIds;
@override List<String> get participantIds {
  if (_participantIds is EqualUnmodifiableListView) return _participantIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_participantIds);
}

@override final  bool isActive;

/// Create a copy of Raid
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RaidCopyWith<_Raid> get copyWith => __$RaidCopyWithImpl<_Raid>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RaidToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Raid&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.maxParticipants, maxParticipants) || other.maxParticipants == maxParticipants)&&const DeepCollectionEquality().equals(other._participantIds, _participantIds)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,maxParticipants,const DeepCollectionEquality().hash(_participantIds),isActive);

@override
String toString() {
  return 'Raid(id: $id, title: $title, maxParticipants: $maxParticipants, participantIds: $participantIds, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$RaidCopyWith<$Res> implements $RaidCopyWith<$Res> {
  factory _$RaidCopyWith(_Raid value, $Res Function(_Raid) _then) = __$RaidCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, int maxParticipants, List<String> participantIds, bool isActive
});




}
/// @nodoc
class __$RaidCopyWithImpl<$Res>
    implements _$RaidCopyWith<$Res> {
  __$RaidCopyWithImpl(this._self, this._then);

  final _Raid _self;
  final $Res Function(_Raid) _then;

/// Create a copy of Raid
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? maxParticipants = null,Object? participantIds = null,Object? isActive = null,}) {
  return _then(_Raid(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,maxParticipants: null == maxParticipants ? _self.maxParticipants : maxParticipants // ignore: cast_nullable_to_non_nullable
as int,participantIds: null == participantIds ? _self._participantIds : participantIds // ignore: cast_nullable_to_non_nullable
as List<String>,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
