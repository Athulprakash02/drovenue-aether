import 'dart:async';
import 'package:get/get.dart';

enum BossState { preparing, live }

class CountdownController extends GetxController {
  final RxInt _remainingMilliseconds = 0.obs;
  final Rx<BossState> bossState = BossState.preparing.obs;

  Timer? _timer;
  DateTime? _endTime;

  final String bossName = 'Infernal Shadow Dragon';

  String get formattedTime {
    if (bossState.value == BossState.live ||
        _remainingMilliseconds.value <= 0) {
      return '00:00:00:000';
    }

    final int totalMs = _remainingMilliseconds.value;
    final int hours = totalMs ~/ 3600000;
    final int minutes = (totalMs % 3600000) ~/ 60000;
    final int seconds = (totalMs % 60000) ~/ 1000;
    final int milliseconds = totalMs % 1000;

    // Format: HH:MM:SS:MS
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}:${milliseconds.toString().padLeft(3, '0')}';
  }

  @override
  void onInit() {
    super.onInit();
    _startTimer();
  }

  void _startTimer() {
    bossState.value = BossState.preparing;
    // Set for 20 seconds to quickly demonstrate the "LIVE" transition
    _endTime = DateTime.now().add(const Duration(seconds: 20));

    // Update every 100ms
    const Duration updateInterval = Duration(milliseconds: 100);

    _timer?.cancel();
    _timer = Timer.periodic(updateInterval, (Timer timer) {
      final DateTime now = DateTime.now();

      if (_endTime!.isAfter(now)) {
        _remainingMilliseconds.value = _endTime!.difference(now).inMilliseconds;
      } else {
        _remainingMilliseconds.value = 0;
        _timer?.cancel();
        _triggerBossLive();
      }
    });
  }

  void _triggerBossLive() {
    bossState.value = BossState.live;

    // Keep it LIVE for 10 seconds, then reset for the next spawn
    Future<void>.delayed(const Duration(seconds: 10), () {
      if (!isClosed) {
        _startTimer();
      }
    });
  }

  void resetTimer() {
    _startTimer();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
