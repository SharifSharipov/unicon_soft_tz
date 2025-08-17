import 'dart:async';
import 'package:flutter/material.dart';
import 'package:unicon_soft_tz/app.dart' as app;
import 'package:unicon_soft_tz/injector_container_path.dart' as di;
import 'service/background_service.dart';

Future<void> main() async {
  runZonedGuarded(
        () async {
      WidgetsFlutterBinding.ensureInitialized();
      await di.init();
      final backgroundService = di.sl<BackgroundService>();
      await backgroundService.initialize(
        onSetFlag: (flag) =>
            debugPrint('Flag set to: $flag at ${DateTime.now()}'),
      );

      runApp(app.MainApp());
    },
        (error, stackTrace) {
      debugPrint('Caught error: $error at ${DateTime.now()}');
      debugPrint('Stack trace: $stackTrace at ${DateTime.now()}');

    },
  );
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
