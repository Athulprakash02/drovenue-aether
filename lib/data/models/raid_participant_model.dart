import 'package:freezed_annotation/freezed_annotation.dart';

part 'raid_participant_model.freezed.dart';
part 'raid_participant_model.g.dart';

@freezed
abstract class RaidParticipant with _$RaidParticipant {
  const factory RaidParticipant({
    required String userId,
    required String displayName,
    required DateTime joinedAt,
    String? avatarUrl,
  }) = _RaidParticipant;

  factory RaidParticipant.fromJson(Map<String, dynamic> json) => _$RaidParticipantFromJson(json);
}
