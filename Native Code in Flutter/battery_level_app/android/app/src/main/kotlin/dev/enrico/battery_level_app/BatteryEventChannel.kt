package dev.enrico.battery_level_app

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.EventChannel.EventSink

class BatteryEventChannel(context: Context): EventChannel.StreamHandler {
    private  var charginStateChangeReceiver: BroadcastReceiver? = null  // BroadcastReceiver - Kotlin's Observer
    private var applicationContext: Context = context

    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        charginStateChangeReceiver = createChargingStateChangeReveiver(events!!)

        applicationContext.registerReceiver(
            charginStateChangeReceiver, IntentFilter(Intent.ACTION_BATTERY_CHANGED)
        )
    }

    override fun onCancel(arguments: Any?) {  // dispose
        applicationContext.unregisterReceiver(charginStateChangeReceiver)
        charginStateChangeReceiver = null
    }

    private fun createChargingStateChangeReveiver(events: EventSink): BroadcastReceiver? {
        return object: BroadcastReceiver() {
            override fun onReceive(context: Context?, intent: Intent) {
                val batteryPct = intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100 / intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1)
                events.success(batteryPct)
            }
        }
    }
}