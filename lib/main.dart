import 'package:flutter/material.dart';
import 'package:timer_app/pages/pages.dart';
import 'package:timer_app/services/services.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await HiveInstance.initializeHive();
 setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(    
      home: HomePage(),
    );
  }
}
