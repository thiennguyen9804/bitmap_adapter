import 'dart:typed_data';

import 'package:bitmap_adapter/dto/yuv_image.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'bitmap_adapter_method_channel.dart';

abstract class BitmapAdapterPlatform extends PlatformInterface {
  /// Constructs a BitmapAdapterPlatform.
  BitmapAdapterPlatform() : super(token: _token);

  static final Object _token = Object();

  static BitmapAdapterPlatform _instance = MethodChannelBitmapAdapter();

  /// The default instance of [BitmapAdapterPlatform] to use.
  ///
  /// Defaults to [MethodChannelBitmapAdapter].
  static BitmapAdapterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [BitmapAdapterPlatform] when
  /// they register themselves.
  static set instance(BitmapAdapterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<Uint8List> convertToBitmap(YuvImage image) {
    throw UnimplementedError(
      'convertToBitmap(YuvImage image) has not been implemented.',
    );
  }
}
