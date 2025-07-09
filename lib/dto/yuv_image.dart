import 'dart:typed_data';

class YuvImage {
  final int width;
  final int height;
  final Uint8List y;
  final Uint8List u;
  final Uint8List v;
  final int yRowStride;
  final int uvRowStride;
  final int yPixelStride;
  final int uvPixelStride;

  YuvImage({
    required this.width,
    required this.height,
    required this.y,
    required this.u,
    required this.v,
    required this.yRowStride,
    required this.uvRowStride,
    required this.yPixelStride,
    required this.uvPixelStride,
  });

  /// Tạo từ Map, giả sử `y`, `u`, `v` đã được encode base64 khi ghi ra file
  factory YuvImage.fromMap(Map<String, dynamic> map) {
    return YuvImage(
      width: map['width'],
      height: map['height'],
      y: map['y'],
      u: map['u'],
      v: map['v'],
      yRowStride: map['yRowStride'],
      uvRowStride: map['uvRowStride'],
      yPixelStride: map['yPixelStride'],
      uvPixelStride: map['uvPixelStride'],
    );
  }

  /// Nếu muốn ghi lại thành map (ví dụ để ghi ra file)
  Map<String, dynamic> toMap() {
    return {
      'width': width,
      'height': height,
      'y': y,
      'u': u,
      'v': v,
      'yRowStride': yRowStride,
      'uvRowStride': uvRowStride,
      'yPixelStride': yPixelStride,
      'uvPixelStride': uvPixelStride,
    };
  }
}
