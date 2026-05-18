// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'raid_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Raid _$RaidFromJson(Map<String, dynamic> json) => _Raid(
  id: json['id'] as String,
  title: json['title'] as String,
  maxParticipants: (json['maxParticipants'] as num).toInt(),
  participantIds: (json['participantIds'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  isActive: json['isActive'] as bool,
);

Map<String, dynamic> _$RaidToJson(_Raid instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'maxParticipants': instance.maxParticipants,
  'participantIds': instance.participantIds,
  'isActive': instance.isActive,
};
