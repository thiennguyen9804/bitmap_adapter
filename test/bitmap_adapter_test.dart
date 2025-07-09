import 'package:flutter_test/flutter_test.dart';
import 'package:bitmap_adapter/bitmap_adapter.dart';
import 'package:bitmap_adapter/bitmap_adapter_platform_interface.dart';
import 'package:bitmap_adapter/bitmap_adapter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBitmapAdapterPlatform
    with MockPlatformInterfaceMixin
    implements BitmapAdapterPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final BitmapAdapterPlatform initialPlatform = BitmapAdapterPlatform.instance;

  test('$MethodChannelBitmapAdapter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelBitmapAdapter>());
  });

  test('getPlatformVersion', () async {
    BitmapAdapter bitmapAdapterPlugin = BitmapAdapter();
    MockBitmapAdapterPlatform fakePlatform = MockBitmapAdapterPlatform();
    BitmapAdapterPlatform.instance = fakePlatform;

    expect(await bitmapAdapterPlugin.getPlatformVersion(), '42');
  });
}
