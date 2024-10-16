import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vibe/config/firebase_options.dart';
import 'app.dart';

void main() async {

  // Firebase Setup
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());

}

