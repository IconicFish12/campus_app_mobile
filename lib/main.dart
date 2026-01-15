import 'package:campus_app_mobile/config/config.dart';
import 'package:campus_app_mobile/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/date_symbol_data_file.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  debugPrint("[DEBUG]: APP INITIALIZED");
  try {
    debugPrint("[DEBUG]: FIREBASE INITIALIZED");
    FirebaseApp firebase = await Firebase.initializeApp(
      demoProjectId: 'quest-tara',
      options: DefaultFirebaseOptions.currentPlatform,
      name: 'Quest Tara Mobile'
    );
    debugPrint("[DEBUG]: FIREBASEe Running ${firebase.name}");
  } catch (e) {
    debugPrint("[ERROR]: Error Accoured ${e.toString()}");
  }
  print("DEBUG: Mulai inisialisasi Date Formatting...");
  await initializeDateFormatting('id-ID', '');

  print("DEBUG: Menjalankan runApp...");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Config config = Config();
    final GoRouter router = GoRouter(
      restorationScopeId: 'router',
      routerNeglect: true,
      routes: [],
    );

    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: config.getAppTheme(),
      routerConfig: router,
      restorationScopeId: 'router',

    );
  }
}
