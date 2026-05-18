// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'raid_state_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RaidState {

 String get raidId; String get title; int get maxParticipants; List<RaidParticipant> get participants; bool get isActive; DateTime get createdAt;
/// Create a copy of RaidState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RaidStateCopyWith<RaidState> get copyWith => _$RaidStateCopyWithImpl<RaidState>(this as RaidState, _$identity);

  /// Serializes this RaidState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RaidState&&(identical(other.raidId, raidId) || other.raidId == raidId)&&(identical(other.title, title) || other.title == title)&&(identical(other.maxParticipants, maxParticipants) || other.maxParticipants == maxParticipants)&&const DeepCollectionEquality().equals(other.participants, participants)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,raidId,title,maxParticipants,const DeepCollectionEquality().hash(participants),isActive,createdAt);

@override
String toString() {
  return 'RaidState(raidId: $raidId, title: $title, maxParticipants: $maxParticipants, participants: $participants, isActive: $isActive, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $RaidStateCopyWith<$Res>  {
  factory $RaidStateCopyWith(RaidState value, $Res Function(RaidState) _then) = _$RaidStateCopyWithImpl;
@useResult
$Res call({
 String raidId, String title, int maxParticipants, List<RaidParticipant> participants, bool isActive, DateTime createdAt
});




}
/// @nodoc
class _$RaidStateCopyWithImpl<$Res>
    implements $RaidStateCopyWith<$Res> {
  _$RaidStateCopyWithImpl(this._self, this._then);

  final RaidState _self;
  final $Res Function(RaidState) _then;

/// Create a copy of RaidState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? raidId = null,Object? title = null,Object? maxParticipants = null,Object? participants = null,Object? isActive = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
raidId: null == raidId ? _self.raidId : raidId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,maxParticipants: null == maxParticipants ? _self.maxParticipants : maxParticipants // ignore: cast_nullable_to_non_nullable
as int,participants: null == participants ? _self.participants : participants // ignore: cast_nullable_to_non_nullable
as List<RaidParticipant>,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [RaidState].
extension RaidStatePatterns on RaidState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RaidState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RaidState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RaidState value)  $default,){
final _that = this;
switch (_that) {
case _RaidState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RaidState value)?  $default,){
final _that = this;
switch (_that) {
case _RaidState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String raidId,  String title,  int maxParticipants,  List<RaidParticipant> participants,  bool isActive,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RaidState() when $default != null:
return $default(_that.raidId,_that.title,_that.maxParticipants,_that.participants,_that.isActive,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String raidId,  String title,  int maxParticipants,  List<RaidParticipant> participants,  bool isActive,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _RaidState():
return $default(_that.raidId,_that.title,_that.maxParticipants,_that.participants,_that.isActive,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String raidId,  String title,  int maxParticipants,  List<RaidParticipant> participants,  bool isActive,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _RaidState() when $default != null:
return $default(_that.raidId,_that.title,_that.maxParticipants,_that.participants,_that.isActive,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RaidState implements RaidState {
  const _RaidState({required this.raidId, required this.title, required this.maxParticipants, required final  List<RaidParticipant> participants, required this.isActive, required this.createdAt}): _participants = participants;
  factory _RaidState.fromJson(Map<String, dynamic> json) => _$RaidStateFromJson(json);

@override final  String raidId;
@override final  String title;
@override final  int maxParticipants;
 final  List<RaidParticipant> _participants;
@override List<RaidParticipant> get participants {
  if (_participants is EqualUnmodifiableListView) return _participants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_participants);
}

@override final  bool isActive;
@override final  DateTime createdAt;

/// Create a copy of RaidState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RaidStateCopyWith<_RaidState> get copyWith => __$RaidStateCopyWithImpl<_RaidState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RaidStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RaidState&&(identical(other.raidId, raidId) || other.raidId == raidId)&&(identical(other.title, title) || other.title == title)&&(identical(other.maxParticipants, maxParticipants) || other.maxParticipants == maxParticipants)&&const DeepCollectionEquality().equals(other._participants, _participants)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,raidId,title,maxParticipants,const DeepCollectionEquality().hash(_participants),isActive,createdAt);

@override
String toString() {
  return 'RaidState(raidId: $raidId, title: $title, maxParticipants: $maxParticipants, participants: $participants, isActive: $isActive, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$RaidStateCopyWith<$Res> implements $RaidStateCopyWith<$Res> {
  factory _$RaidStateCopyWith(_RaidState value, $Res Function(_RaidState) _then) = __$RaidStateCopyWithImpl;
@override @useResult
$Res call({
 String raidId, String title, int maxParticipants, List<RaidParticipant> participants, bool isActive, DateTime createdAt
});




}
/// @nodoc
class __$RaidStateCopyWithImpl<$Res>
    implements _$RaidStateCopyWith<$Res> {
  __$RaidStateCopyWithImpl(this._self, this._then);

  final _RaidState _self;
  final $Res Function(_RaidState) _then;

/// Create a copy of RaidState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? raidId = null,Object? title = null,Object? maxParticipants = null,Object? participants = null,Object? isActive = null,Object? createdAt = null,}) {
  return _then(_RaidState(
raidId: null == raidId ? _self.raidId : raidId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,maxParticipants: null == maxParticipants ? _self.maxParticipants : maxParticipants // ignore: cast_nullable_to_non_nullable
as int,participants: null == participants ? _self._participants : participants // ignore: cast_nullable_to_non_nullable
as List<RaidParticipant>,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
