import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bitmap_adapter/bitmap_adapter_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelBitmapAdapter platform = MethodChannelBitmapAdapter();
  const MethodChannel channel = MethodChannel('bitmap_adapter');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
