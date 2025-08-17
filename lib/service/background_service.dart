import 'package:flutter/cupertino.dart';
import 'package:workmanager/workmanager.dart';
import 'native_ui_bridge.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

const String _notificationTask = 'com.example.unicon_soft_tz.notificationTask';

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    try {
      debugPrint('Workmanager task running: $task at ${DateTime.now()}');

      if (task == _notificationTask) {
        final uiControl = sl<UiControlBridge>();
        final serviceStatus = await uiControl.manageNotificationService(
          title: 'Background Task Reminder',
          message: 'This is a background notification!',
          intervalSeconds: 30,
        );

        debugPrint('Service status: $serviceStatus at ${DateTime.now()}');
        if (serviceStatus['success'] == true) {
          debugPrint('Background notification service managed successfully');
        } else {
          debugPrint(
              'Failed to manage background notification: ${serviceStatus['message']}');
        }
      }
      return Future.value(true);
    } catch (e) {
      debugPrint('Error in background task: $e at ${DateTime.now()}');
      return Future.value(false);
    }
  });
}

class BackgroundService {
  static final BackgroundService _instance = BackgroundService._internal();
  factory BackgroundService() => _instance;
  BackgroundService._internal();

  Future<void> initialize({required ValueSetter<bool> onSetFlag}) async {
    try {
      final uiControl = sl<UiControlBridge>();
      uiControl.registerHandlers(onSetFlag: onSetFlag);

      await Workmanager().initialize(
        callbackDispatcher,
        // ignore: deprecated_member_use
        isInDebugMode: true,
      );
      debugPrint('Workmanager initialized successfully at ${DateTime.now()}');
    } catch (e) {
      debugPrint('Error initializing background service: $e at ${DateTime.now()}');
      throw Exception('Failed to initialize background service: $e');
    }
  }

  // Schedule a recurring background task
  Future<void> scheduleBackgroundTask({
    required int intervalSeconds,
  }) async {
    try {
      await Workmanager().registerPeriodicTask(
        'notificationTaskId',
        _notificationTask,
        frequency: Duration(seconds: intervalSeconds),
        initialDelay: Duration(seconds: 10),
        constraints: Constraints(
          networkType: NetworkType.notRequired,
        ),
      );
      debugPrint(
          'Background task scheduled with interval: $intervalSeconds seconds at ${DateTime.now()}');
    } catch (e) {
      debugPrint('Error scheduling background task: $e at ${DateTime.now()}');
      throw Exception('Failed to schedule background task: $e');
    }
  }

  Future<void> cancelBackgroundTask() async {
    try {
      await Workmanager().cancelByUniqueName('notificationTaskId');
      debugPrint('Background task cancelled at ${DateTime.now()}');
    } catch (e) {
      debugPrint('Error cancelling background task: $e at ${DateTime.now()}');
      throw Exception('Failed to cancel background task: $e');
    }
  }


  Future<void> dispose() async {
    try {
      await cancelBackgroundTask();
      debugPrint('Background service disposed at ${DateTime.now()}');
    } catch (e) {
      debugPrint('Error disposing background service: $e at ${DateTime.now()}');
    }
  }
}