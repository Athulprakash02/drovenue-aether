import 'package:freezed_annotation/freezed_annotation.dart';

part 'raid_model.freezed.dart';
part 'raid_model.g.dart';

@freezed
abstract class Raid with _$Raid {
  const factory Raid({
    required String id,
    required String title,
    required int maxParticipants,
    required List<String> participantIds,
    required bool isActive,
  }) = _Raid;

  factory Raid.fromJson(Map<String, dynamic> json) => _$RaidFromJson(json);
}
