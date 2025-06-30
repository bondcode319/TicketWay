import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:bus_ticketing_app/config/firebase_options.dart';
import 'package:bus_ticketing_app/config/theme.dart';
import 'package:bus_ticketing_app/screens/splash_screen.dart';
import 'package:bus_ticketing_app/services/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize notifications
  final notificationService = NotificationService();
  await notificationService.initialize();

  runApp(const ProviderScope(child: BusTicketingApp()));
}

class BusTicketingApp extends StatelessWidget {
  const BusTicketingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bus Ticketing',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const SplashScreen(),
    );
  }
}
