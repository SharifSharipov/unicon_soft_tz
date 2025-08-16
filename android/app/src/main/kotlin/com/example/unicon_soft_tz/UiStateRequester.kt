package com.example.unicon_soft_tz

import android.content.Context
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.plugin.common.MethodChannel

fun requestUiStateFromAnyContext(
    context: Context,
    onSuccess: (Map<String, Any?>) -> Unit,
    onError: (Throwable) -> Unit
) {
    // FlutterEngine oldindan cache’ga yozilgan bo‘lishi kerak
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
