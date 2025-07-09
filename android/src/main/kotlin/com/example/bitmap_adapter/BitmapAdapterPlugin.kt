package com.example.bitmap_adapter

import android.renderscript.RenderScript
import android.util.Log
import com.google.android.renderscript.Toolkit
import com.google.android.renderscript.YuvFormat
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** BitmapAdapterPlugin */
class BitmapAdapterPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "bitmap_adapter")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "getPlatformVersion") {
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
    } else if(call.method == "convertToBitmap") {
      val arguments = call.arguments as? Map<*, *>
      if (arguments != null) {
        val image = Yuv2Nv21Adapter(arguments)
        val res = imageProcess(image)
        result.success(res)
      } else {
        result.error("INVALID_ARGS", "Invalid arguments received", "Invalid arguments received")
      }
    }
    else {
      result.notImplemented()
    }
  }

  private fun imageProcess(image: Yuv420888Image): IntArray {
    val nv21 = (image as Yuv2Nv21Adapter).toNv21()
    val bitmap = Toolkit.yuvToRgbBitmap(nv21!!, image.width, image.height, YuvFormat.NV21)
    val pixels = IntArray(image.width * image.height)
    bitmap.getPixels(
      pixels,
      0,
      bitmap,
      0, 0,
      image.width,
      image.height
    )
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
