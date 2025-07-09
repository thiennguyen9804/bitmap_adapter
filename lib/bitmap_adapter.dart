import 'package:bitmap_adapter/dto/yuv_image.dart';
import 'package:flutter/foundation.dart';

import 'bitmap_adapter_platform_interface.dart';

class BitmapAdapter {
  Future<String?> getPlatformVersion() {
    return BitmapAdapterPlatform.instance.getPlatformVersion();
  }

  Future<Uint8List> covertToBitmap(YuvImage image) {
    return BitmapAdapterPlatform.instance.convertToBitmap(image);
  }
}
