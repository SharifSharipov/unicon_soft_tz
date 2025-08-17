package com.example.unicon_soft_tz

import android.content.Context
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.plugin.common.MethodChannel


fun requestUiStateFromAnyContext(
    context: Context,
    onSuccess: (Map<String, Any?>) -> Unit,
    onError: (Throwable) -> Unit
) {
    val engine = FlutterEngineCache.getInstance().get("main_engine")
        ?: return onError(IllegalStateException("Flutter engine not running"))

    val channel = MethodChannel(engine.dartExecutor.binaryMessenger, "ui_control")

    channel.invokeMethod("getUiState", null, object : MethodChannel.Result {
        override fun success(result: Any?) {
            val map = (result as? Map<String, Any?>) ?: emptyMap()
            onSuccess(map)
        }

        override fun error(code: String, message: String?, details: Any?) {
            onError(IllegalStateException("$code: $message"))
        }

        override fun notImplemented() {
            onError(UnsupportedOperationException("getUiState not implemented in Dart"))
        }
    })
}

object NotificationHelper {

    private const val NOTIFICATION_CHANNEL = "com.example.unicon_soft_tz.notification_service"

    fun startNotificationServiceFromAnyContext(
        context: Context,
        title: String,
        message: String,
        intervalSeconds: Int = 30,
        onSuccess: (String) -> Unit,
        onError: (Throwable) -> Unit
    ) {
        val engine = FlutterEngineCache.getInstance().get("main_engine")
            ?: return onError(IllegalStateException("Flutter engine not running"))

        val channel = MethodChannel(engine.dartExecutor.binaryMessenger, NOTIFICATION_CHANNEL)

        val args = mapOf(
            "title" to title,
            "message" to message,
            "intervalSeconds" to intervalSeconds
        )

        channel.invokeMethod("startNotificationService", args, object : MethodChannel.Result {
            override fun success(result: Any?) {
                onSuccess(result?.toString() ?: "Service started")
            }

            override fun error(code: String, message: String?, details: Any?) {
                onError(IllegalStateException("$code: $message"))
            }

            override fun notImplemented() {
                onError(UnsupportedOperationException("startNotificationService not implemented"))
            }
        })
    }
    fun stopNotificationServiceFromAnyContext(
        context: Context,
        onSuccess: (String) -> Unit,
        onError: (Throwable) -> Unit
    ) {
        val engine = FlutterEngineCache.getInstance().get("main_engine")
            ?: return onError(IllegalStateException("Flutter engine not running"))

        val channel = MethodChannel(engine.dartExecutor.binaryMessenger, NOTIFICATION_CHANNEL)

        channel.invokeMethod("stopNotificationService", null, object : MethodChannel.Result {
            override fun success(result: Any?) {
                onSuccess(result?.toString() ?: "Service stopped")
            }

            override fun error(code: String, message: String?, details: Any?) {
                onError(IllegalStateException("$code: $message"))
            }

            override fun notImplemented() {
                onError(UnsupportedOperationException("stopNotificationService not implemented"))
            }
        })
    }
    fun sendSingleNotificationFromAnyContext(
        context: Context,
        title: String,
        message: String,
        onSuccess: (String) -> Unit,
        onError: (Throwable) -> Unit
    ) {
        val engine = FlutterEngineCache.getInstance().get("main_engine")
            ?: return onError(IllegalStateException("Flutter engine not running"))

        val channel = MethodChannel(engine.dartExecutor.binaryMessenger, NOTIFICATION_CHANNEL)

        val args = mapOf(
            "title" to title,
            "message" to message
        )

        channel.invokeMethod("sendSingleNotification", args, object : MethodChannel.Result {
            override fun success(result: Any?) {
                onSuccess(result?.toString() ?: "Notification sent")
            }

            override fun error(code: String, message: String?, details: Any?) {
                onError(IllegalStateException("$code: $message"))
            }

            override fun notImplemented() {
                onError(UnsupportedOperationException("sendSingleNotification not implemented"))
            }
        })
    }

    fun checkNotificationPermissionFromAnyContext(
        context: Context,
        onSuccess: (Boolean) -> Unit,
        onError: (Throwable) -> Unit
    ) {
        val engine = FlutterEngineCache.getInstance().get("main_engine")
            ?: return onError(IllegalStateException("Flutter engine not running"))

        val channel = MethodChannel(engine.dartExecutor.binaryMessenger, NOTIFICATION_CHANNEL)

        channel.invokeMethod("checkNotificationPermission", null, object : MethodChannel.Result {
            override fun success(result: Any?) {
                val hasPermission = result as? Boolean ?: false
                onSuccess(hasPermission)
            }

            override fun error(code: String, message: String?, details: Any?) {
                onError(IllegalStateException("$code: $message"))
            }

            override fun notImplemented() {
                onError(UnsupportedOperationException("checkNotificationPermission not implemented"))
            }
        })
    }
}

