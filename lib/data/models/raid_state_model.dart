import 'package:freezed_annotation/freezed_annotation.dart';
import 'raid_participant_model.dart';

part 'raid_state_model.freezed.dart';
part 'raid_state_model.g.dart';

@freezed
abstract class RaidState with _$RaidState {
  const factory RaidState({
    required String raidId,
    required String title,
    required int maxParticipants,
    required List<RaidParticipant> participants,
    required bool isActive,
    required DateTime createdAt,
  }) = _RaidState;

  factory RaidState.fromJson(Map<String, dynamic> json) => _$RaidStateFromJson(json);
}
