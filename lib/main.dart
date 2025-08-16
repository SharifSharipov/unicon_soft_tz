import 'package:unicon_soft_tz/app.dart';
import 'package:unicon_soft_tz/injector_container_path.dart' as di;
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // WidgetsBinding.instance.handleDrawFrame();

  await di.init();
  //await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

/// flutter run -d windows
/// flutter run --release
/// flutter build apk --release
/// flutter build apk --split-per-abi
/// flutter build appbundle --release
/// flutter pub run build_runner watch --deleote-conflicting-outputs
/// flutter pub ipa
/// dart fix --apply
/// flutter run -d chrome
/// dart run build_runner clean
/// dart run build_runner build --delete-conflicting-outputs