package com.example.unicon_soft_tz

import android.Manifest
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.os.Build
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.util.Log
import androidx.core.app.NotificationCompat
import kotlin.random.Random

class MainActivity : FlutterActivity() {
    private val UI_CHANNEL = "ui_control"
    private val NOTIFICATION_CHANNEL = "com.example.unicon_soft_tz.notification_service"
    private val TAG = "MainActivity"
    private val NOTIFICATION_PERMISSION_REQUEST_CODE = 1001

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        try {
            Log.d(TAG, "Configuring Flutter engine at ${System.currentTimeMillis()}")

            io.flutter.embedding.engine.FlutterEngineCache
                .getInstance()
                .put("main_engine", flutterEngine)
            Log.d(TAG, "Engine cached successfully")

            requestNotificationPermission()

            MethodChannel(flutterEngine.dartExecutor.binaryMessenger, UI_CHANNEL)
                .setMethodCallHandler { call, result ->
                    when (call.method) {
                        "setFlag" -> {
                            val enabled = call.argument<Boolean>("enabled") ?: false
                            Log.d(TAG, "Setting flag to: $enabled")
                            result.success(null)
                        }
                        else -> result.notImplemented()
                    }
                }

            MethodChannel(flutterEngine.dartExecutor.binaryMessenger, NOTIFICATION_CHANNEL)
                .setMethodCallHandler { call, result ->
                    when (call.method) {
                        "startNotificationService" -> {
                            val title = call.argument<String>("title") ?: "Notification"
                            val message = call.argument<String>("message") ?: "Background notification"
                            val intervalSeconds = call.argument<Int>("intervalSeconds") ?: 30
                            val foregroundTitle = call.argument<String>("foreground_title")
                            val foregroundMessage = call.argument<String>("foreground_message")

                            startNotificationService(title, message, intervalSeconds, foregroundTitle, foregroundMessage, result)
                        }
                        "stopNotificationService" -> stopNotificationService(result)
                        "sendSingleNotification" -> {
                            val title = call.argument<String>("title") ?: "Notification"
                            val message = call.argument<String>("message") ?: "Single notification"
                            sendSingleNotification(title, message, result)
                        }
                        "checkNotificationPermission" -> {
                            result.success(hasNotificationPermission())
                        }
                        "isNotificationServiceRunning" -> {
                            val isRunning = isServiceRunning(NotificationService::class.java)
                            result.success(isRunning)
                        }
                        else -> result.notImplemented()
                    }
                }

        } catch (e: Exception) {
            Log.e(TAG, "Error configuring Flutter engine", e)
        }
    }

    private fun requestNotificationPermission() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            if (ContextCompat.checkSelfPermission(
                    this,
                    Manifest.permission.POST_NOTIFICATIONS
                ) != PackageManager.PERMISSION_GRANTED
            ) {
                ActivityCompat.requestPermissions(
                    this,
                    arrayOf(Manifest.permission.POST_NOTIFICATIONS),
                    NOTIFICATION_PERMISSION_REQUEST_CODE
                )
            }
        }
    }

    private fun hasNotificationPermission(): Boolean {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            ContextCompat.checkSelfPermission(
                this,
                Manifest.permission.POST_NOTIFICATIONS
            ) == PackageManager.PERMISSION_GRANTED
        } else {
            true
        }
    }

    private fun startNotificationService(
        title: String,
        message: String,
        intervalSeconds: Int,
        foregroundTitle: String?,
        foregroundMessage: String?,
        result: MethodChannel.Result
    ) {
        val intent = Intent(this, NotificationService::class.java).apply {
            action = NotificationService.ACTION_START
            putExtra(NotificationService.EXTRA_TITLE, title)
            putExtra(NotificationService.EXTRA_MESSAGE, message)
            putExtra(NotificationService.EXTRA_INTERVAL, intervalSeconds * 1000L)
            putExtra("foreground_title", foregroundTitle ?: "Background Service")
            putExtra("foreground_message", foregroundMessage ?: "Service is running...")
        }
        startService(intent)
        result.success("Notification service started")
    }

    private fun stopNotificationService(result: MethodChannel.Result) {
        val intent = Intent(this, NotificationService::class.java).apply {
            action = NotificationService.ACTION_STOP
        }
        stopService(intent)
        result.success("Notification service stopped")
    }

    private fun sendSingleNotification(
        title: String,
        message: String,
        result: MethodChannel.Result
    ) {
        val notificationManager = getSystemService(Context.NOTIFICATION_SERVICE) as android.app.NotificationManager
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channel = android.app.NotificationChannel(
                "single_notification_channel",
                "Single Notifications",
                android.app.NotificationManager.IMPORTANCE_HIGH
            )
            notificationManager.createNotificationChannel(channel)
        }

        val notificationId = Random.nextInt(9000) + 1000
        val notification = NotificationCompat.Builder(this, "single_notification_channel")
            .setContentTitle(title)
            .setContentText(message)
            .setSmallIcon(android.R.drawable.ic_dialog_info)
            .setPriority(NotificationCompat.PRIORITY_HIGH)
            .setAutoCancel(true)
            .build()

        notificationManager.notify(notificationId, notification)
        result.success("Single notification sent")
    }

    private fun isServiceRunning(serviceClass: Class<*>): Boolean {
        val manager = getSystemService(Context.ACTIVITY_SERVICE) as android.app.ActivityManager
        @Suppress("DEPRECATION")
        for (service in manager.getRunningServices(Integer.MAX_VALUE)) {
            if (serviceClass.name == service.service.className) {
                return true
            }
        }
        return false
    }
}
