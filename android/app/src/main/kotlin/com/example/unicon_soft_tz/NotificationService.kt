package com.example.unicon_soft_tz

import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.app.Service
import android.content.Context
import android.content.Intent
import android.os.Build
import android.os.IBinder
import androidx.core.app.NotificationCompat
import kotlinx.coroutines.*
import java.util.*

class NotificationService : Service() {

    private val serviceScope = CoroutineScope(SupervisorJob() + Dispatchers.IO)
    private var isServiceRunning = false

    companion object {
        const val ACTION_START = "ACTION_START_NOTIFICATION"
        const val ACTION_STOP = "ACTION_STOP_NOTIFICATION"
        const val CHANNEL_ID = "background_notification_channel"
        const val NOTIFICATION_ID = 2001
        const val EXTRA_TITLE = "notification_title"
        const val EXTRA_MESSAGE = "notification_message"
        const val EXTRA_INTERVAL = "notification_interval"
    }

    override fun onBind(intent: Intent?): IBinder? = null

    override fun onCreate() {
        super.onCreate()
        createNotificationChannel()
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        when (intent?.action) {
            ACTION_START -> {
                val title = intent.getStringExtra(EXTRA_TITLE) ?: "Background Notification"
                val message = intent.getStringExtra(EXTRA_MESSAGE) ?: "Service ishlayapti"
                val interval = intent.getLongExtra(EXTRA_INTERVAL, 30000L)
                startNotificationService(intent, title, message, interval)
            }
            ACTION_STOP -> stopNotificationService()
        }
        return START_STICKY
    }

    private fun startNotificationService(intent: Intent, title: String, message: String, interval: Long) {
        if (isServiceRunning) return
        isServiceRunning = true

        val foregroundTitle = intent.getStringExtra("foreground_title") ?: "Background Service"
        val foregroundMsg = intent.getStringExtra("foreground_message") ?: "Service ishlamoqda..."

        val foregroundNotification = createNotification(
            foregroundTitle,
            foregroundMsg
        )
        startForeground(NOTIFICATION_ID, foregroundNotification)

        serviceScope.launch {
            while (isServiceRunning) {
                requestUiStateFromAnyContext(
                    this@NotificationService,
                    onSuccess = { state ->
                        val isOn = state["isOn"] as? Boolean ?: false
                        if (!isOn) {
                            stopNotificationService()
                        } else {
                            sendPeriodicNotification(title, message)
                        }
                    },
                    onError = {
                        sendPeriodicNotification(title, message)
                    }
                )
                delay(interval)
            }
        }
    }

    private fun sendPeriodicNotification(title: String, message: String) {
        val notificationManager = getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager

        val currentTime = java.text.SimpleDateFormat("HH:mm:ss", Locale.getDefault())
            .format(Date())

        val notification = NotificationCompat.Builder(this, CHANNEL_ID)
            .setContentTitle(title)
            .setContentText("$message - $currentTime")
            .setSmallIcon(android.R.drawable.ic_dialog_info)
            .setPriority(NotificationCompat.PRIORITY_HIGH)
            .setAutoCancel(true)
            .setContentIntent(createMainActivityPendingIntent())
            .build()

        val randomId = (1000..9999).random()
        notificationManager.notify(randomId, notification)
    }

    private fun stopNotificationService() {
        isServiceRunning = false
        stopForeground(true)
        stopSelf()
    }

    private fun createNotification(title: String, content: String) =
        NotificationCompat.Builder(this, CHANNEL_ID)
            .setContentTitle(title)
            .setContentText(content)
            .setSmallIcon(android.R.drawable.ic_dialog_info)
            .setOngoing(true)
            .setPriority(NotificationCompat.PRIORITY_LOW)
            .setContentIntent(createMainActivityPendingIntent())
            .build()

    private fun createMainActivityPendingIntent(): PendingIntent {
        val intent = Intent(this, MainActivity::class.java).apply {
            flags = Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_CLEAR_TASK
        }
        return PendingIntent.getActivity(
            this, 0, intent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )
    }

    private fun createNotificationChannel() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channel = NotificationChannel(
                CHANNEL_ID,
                "Background Notifications",
                NotificationManager.IMPORTANCE_HIGH
            ).apply {
                description = "Background notification service uchun kanal"
                enableVibration(true)
                enableLights(true)
            }

            val notificationManager = getSystemService(NotificationManager::class.java)
            notificationManager.createNotificationChannel(channel)
        }
    }

    override fun onDestroy() {
        super.onDestroy()
        isServiceRunning = false
        serviceScope.cancel()
    }
}
