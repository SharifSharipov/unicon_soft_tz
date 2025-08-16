package com.example.unicon_soft_tz  // Use same everywhere

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.util.Log

class MainActivity: FlutterActivity() {
    private val CHANNEL = "ui_control"
    private val TAG = "MainActivity"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        try {
            Log.d(TAG, "Configuring Flutter engine")

            // Cache engine
            io.flutter.embedding.engine.FlutterEngineCache
                .getInstance()
                .put("main_engine", flutterEngine)
            Log.d(TAG, "Engine cached successfully")

            // Method channel
            MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
                .setMethodCallHandler { call, result ->
                    try {
                        Log.d(TAG, "Received method call: ${call.method}")
                        when (call.method) {
                            "setFlag" -> {
                                val enabled = call.argument<Boolean>("enabled") ?: false
                                Log.d(TAG, "Setting flag to: $enabled")
                                result.success(null)
                            }
                            else -> {
                                Log.w(TAG, "Method not implemented: ${call.method}")
                                result.notImplemented()
                            }
                        }
                    } catch (e: Exception) {
                        Log.e(TAG, "Error handling method call", e)
                        result.error("ANDROID_ERROR", e.message, null)
                    }
                }
            Log.d(TAG, "Method channel configured successfully")
        } catch (e: Exception) {
            Log.e(TAG, "Error configuring Flutter engine", e)
        }
    }
}