import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart' hide FirebaseService;
import '../utils/logger.dart';

class FirebaseService extends GetxService {
  Future<FirebaseService> init() async {
    try {
      await Firebase.initializeApp();
      AppLogger.info('Firebase initialized in FirebaseService');
    } catch (e, stack) {
      AppLogger.error('Failed to initialize Firebase', error: e, stackTrace: stack);
    }
    return this;
  }
}
