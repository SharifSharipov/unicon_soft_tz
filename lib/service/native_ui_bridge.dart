import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import '../features/add_task/data/data_source/local_data_base.dart';
import '../features/add_task/data/models/todo_model.dart';

class UiControlBridge {
  static const _uiChannel = MethodChannel('ui_control');
  static const _notificationChannel =
  MethodChannel('com.example.unicon_soft_tz.notification_service');

  void registerHandlers({
    required ValueSetter<bool> onSetFlag,
  }) {
    _uiChannel.setMethodCallHandler((call) async {
      try {
        debugPrint('Received method call: ${call.method}');

        switch (call.method) {
          case 'getUiState':
            final result = await _getUiStateSafely();
            debugPrint('UI State result: $result');
            return result;

          case 'setFlag':
            final arg = call.arguments;
            final v = (arg is bool) ? arg : (arg is num ? arg != 0 : false);
            debugPrint('Setting flag to: $v');
            onSetFlag(v);
            return {'success': true};

          default:
            debugPrint('Unknown method: ${call.method}');
            throw PlatformException(code: '404', message: 'Not implemented');
        }
      } catch (e, stackTrace) {
        debugPrint('Error in method channel: $e');
        debugPrint('Stack trace: $stackTrace');
        throw PlatformException(
          code: 'FLUTTER_ERROR',
          message: e.toString(),
          details: stackTrace.toString(),
        );
      }
    });
  }
  Future<Map<String, dynamic>> manageNotificationService({
    required String title,
    required String message,
    String foregroundTitle = "Background Service",
    String foregroundMessage = "Service is running...",
    int intervalSeconds = 30,
  }) async {
    try {
      final permissionResult =
          await _notificationChannel.invokeMethod('checkNotificationPermission');
      if (permissionResult is! bool || !permissionResult) {
        return {
          'success': false,
          'message': 'Notification permission denied',
          'isServiceRunning': false,
        };
      }

      final startResult = await _notificationChannel.invokeMethod(
        'startNotificationService',
        {
          'title': title,
          'message': message,
          'intervalSeconds': intervalSeconds,
          'foreground_title': foregroundTitle,
          'foreground_message': foregroundMessage,
        },
      );

      final runningResult =
          await _notificationChannel.invokeMethod('isNotificationServiceRunning');
      final isRunning = runningResult is bool ? runningResult : false;

      return {
        'success': true,
        'message': startResult?.toString() ?? 'Service started',
        'isServiceRunning': isRunning,
      };
    } on PlatformException catch (e) {
      return {
        'success': false,
        'message': 'Failed: ${e.message}',
        'isServiceRunning': false,
      };
    }
  }

  Future<String> stopNotificationService() async {
    try {
      final result = await _notificationChannel.invokeMethod('stopNotificationService');
      return result.toString();
    } catch (e) {
      debugPrint('Error stopping notification service: $e');
      return 'Failed to stop notification service';
    }
  }

  Future<String> sendSingleNotification({
    required String title,
    required String message,
  }) async {
    try {
      final result = await _notificationChannel.invokeMethod('sendSingleNotification', {
        'title': title,
        'message': message,
      });
      return result.toString();
    } catch (e) {
      debugPrint('Error sending single notification: $e');
      return 'Failed to send notification';
    }
  }

  // Get UI state
  Future<Map<String, dynamic>> _getUiStateSafely() async {
    try {
      final todos = await LocalDataBase.instance.getTodos();
      final done = todos.where((t) => t.isCompleted == 1).length;
      final pending = todos.length - done;

      TodoModel next;
      try {
        next = todos.firstWhere(
              (t) => t.isCompleted == 0,
          orElse: () => TodoModel(
            id: 0,
            title: 'All done!',
            description: '',
            startTime: '',
            isCompleted: 1,
          ),
        );
      } catch (e) {
        next = TodoModel(
          id: 0,
          title: 'No tasks',
          description: '',
          startTime: '',
          isCompleted: 1,
        );
      }

      return {
        'isOn': pending > 0,
        'title': next.title,
        'done': done,
        'pending': pending,
      };
    } catch (e) {
      debugPrint('Error getting UI state: $e');
      return {
        'isOn': false,
        'title': 'Error',
        'done': 0,
        'pending': 0,
      };
    }
  }
}
