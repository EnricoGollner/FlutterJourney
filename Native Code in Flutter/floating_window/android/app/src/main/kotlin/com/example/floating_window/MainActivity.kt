package com.example.floating_window

import android.widget.ImageView
import com.yhao.floatwindow.FloatWindow
import com.yhao.floatwindow.Screen
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    companion object {
        val CHANNEL = "floating_window"
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        val channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)

        channel.setMethodCallHandler {
                call, result -> when(call.method) {
                "createAndShow" -> {
                    if (FloatWindow.get() == null) {
                        val imageView = ImageView(applicationContext)
                        imageView.setImageResource(R.drawable.plus)

                        FloatWindow.with(applicationContext).setView(imageView)
                            .setWidth(Screen.width, 0.14f)
                            .setHeight(Screen.width, 0.14f)
                            .setX(Screen.width, 0.5f)
                            .setY(Screen.height, 0.5f)
                            .setDesktopShow(true)
                            .build()

                        imageView.setOnClickListener {
                            channel.invokeMethod("increment", null)
                        }

                        FloatWindow.get().show()
                    }
                }
                "destroy" -> {
                    FloatWindow.destroy()
                }
                else -> {
                    result.notImplemented()
                }
            }
        }

    }

    override fun onDestroy() {
        FloatWindow.destroy()
        super.onDestroy()
    }
}
