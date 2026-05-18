import 'dart:async';
import 'package:get/get.dart';
import '../../../core/constants/app_constants.dart';

class CountdownController extends GetxController {
  final RxInt _remainingMilliseconds = 0.obs;
  Timer? _timer;
  DateTime? _endTime;

  int get remainingMilliseconds => _remainingMilliseconds.value;
  bool get isFinished => _remainingMilliseconds.value <= 0 && _endTime != null;

  // Optimized: Compute formatted string directly to keep the view entirely logic-free
  String get formattedTime {
    if (_remainingMilliseconds.value <= 0) return '0.0';
    
    final int seconds = _remainingMilliseconds.value ~/ 1000;
    // Extracting tenths of a second (100ms precision)
    final int deciseconds = (_remainingMilliseconds.value % 1000) ~/ 100;
    
    return '$seconds.$deciseconds';
  }

  @override
  void onInit() {
    super.onInit();
    _startTimer();
  }

  void _startTimer() {
    // Production Grade: Calculate exact end time to prevent Timer drift.
    // Periodic timers can lag, so calculating against a fixed DateTime is the most robust approach.
    _endTime = DateTime.now().add(const Duration(seconds: AppConstants.countdownDurationSeconds));
    
    // Fire every 100ms
    const Duration updateInterval = Duration(milliseconds: 100);
    _timer = Timer.periodic(updateInterval, (Timer timer) {
      final DateTime now = DateTime.now();
      
      if (_endTime!.isAfter(now)) {
        // Update observable state with exact remaining milliseconds
        _remainingMilliseconds.value = _endTime!.difference(now).inMilliseconds;
      } else {
        _remainingMilliseconds.value = 0;
        _timer?.cancel();
      }
    });
  }

  void resetTimer() {
    _timer?.cancel();
    _startTimer();
  }

  @override
  void onClose() {
    // Clean disposal is CRITICAL to prevent memory leaks and zombie timers
    _timer?.cancel();
    super.onClose();
  }
}
