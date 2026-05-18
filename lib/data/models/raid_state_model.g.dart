// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'raid_state_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RaidState _$RaidStateFromJson(Map<String, dynamic> json) => _RaidState(
  raidId: json['raidId'] as String,
  title: json['title'] as String,
  maxParticipants: (json['maxParticipants'] as num).toInt(),
  participants: (json['participants'] as List<dynamic>)
      .map((e) => RaidParticipant.fromJson(e as Map<String, dynamic>))
      .toList(),
  isActive: json['isActive'] as bool,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$RaidStateToJson(_RaidState instance) =>
    <String, dynamic>{
      'raidId': instance.raidId,
      'title': instance.title,
      'maxParticipants': instance.maxParticipants,
      'participants': instance.participants,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt.toIso8601String(),
    };
