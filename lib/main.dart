import 'package:flutter/material.dart';
import 'package:quest/screens/login/login_screen.dart';
import 'screens/register/register_screen.dart';
import 'services/mongodb_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDBService.connect();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
