import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'bitmap_adapter_platform_interface.dart';

/// An implementation of [BitmapAdapterPlatform] that uses method channels.
class MethodChannelBitmapAdapter extends BitmapAdapterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('bitmap_adapter');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
