// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'raid_participant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RaidParticipant _$RaidParticipantFromJson(Map<String, dynamic> json) =>
    _RaidParticipant(
      userId: json['userId'] as String,
      displayName: json['displayName'] as String,
      joinedAt: DateTime.parse(json['joinedAt'] as String),
      avatarUrl: json['avatarUrl'] as String?,
    );

Map<String, dynamic> _$RaidParticipantToJson(_RaidParticipant instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'displayName': instance.displayName,
      'joinedAt': instance.joinedAt.toIso8601String(),
      'avatarUrl': instance.avatarUrl,
    };
