
import 'bitmap_adapter_platform_interface.dart';

class BitmapAdapter {
  Future<String?> getPlatformVersion() {
    return BitmapAdapterPlatform.instance.getPlatformVersion();
  }
}
