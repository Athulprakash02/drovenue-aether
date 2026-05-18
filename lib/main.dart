import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/services/firebase_service.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';

void main() async {
  // 1. Ensure Flutter binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // 2. Setup production-grade error handling
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    debugPrint('Flutter Error: ${details.exceptionAsString()}');
  };

  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    debugPrint('Async Error: $error');
    return true;
  };

  // 3. Initialize Firebase using our GetX Service
  await Get.putAsync<FirebaseService>(() => FirebaseService().init());

  // 4. Run the app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Aether MMORPG',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0F111A), // Deep dark background
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF00FFC2), // Neon Cyan accent
          secondary: Color(0xFFB026FF), // Neon Purple accent
          surface: Color(0xFF1A1D2D), // Slightly lighter dark surface
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF141622),
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Color(0xFF00FFC2),
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        cardTheme: CardThemeData(
          color: const Color(0xFF1A1D2D),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: Color(0xFF2A2D43), width: 1),
          ),
          elevation: 8,
        ),
      ),
      initialRoute: Routes.home,
      getPages: AppPages.pages,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: const TextScaler.linear(1.0),
          ),
          child: child ?? const SizedBox.shrink(),
        );
      },
    );
  }
}
