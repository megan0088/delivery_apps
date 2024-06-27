import 'package:firebase_core/firebase_core.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hyper_ui/service/main_storage_service/main_storage.dart';
import 'package:path_provider/path_provider.dart';

import 'firebase_options.dart';
/*
TODO: 
Run this command if you don't already have firebase_options.dart
flutterfire configure
Docs: https://firebase.flutter.dev/docs/cli/
*/

Future initialize() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    var path = await getTemporaryDirectory();
    Hive.init(path.path);
  }
  mainStorage = await Hive.openBox('mainStorage');
  if (!kIsWeb && Platform.isWindows) return;

  await Firebase.initializeApp(
    //run > flutterfire configure
    //and import DefaultFirebaseOptions!
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAuth.instance.wait();
}

extension FirebaseAuthExtension on FirebaseAuth {
  wait() async {
    bool ready = false;
    FirebaseAuth.instance.authStateChanges().listen((event) {
      ready = true;
    });

    while (ready == false) {
      await Future.delayed(const Duration(milliseconds: 250));
    }
  }
}
