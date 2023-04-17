import 'dart:ui';

class DetailState {
  static List<Color> get colors => [
        const Color(0xff29695D),
        const Color(0xff5B8EA3),
        const Color(0xff746A36),
        const Color(0xff2E2E2E),
      ];

  static List<String> get sizes => [
        "M 20",
        "L 16",
        "M 6",
        "S 12",
      ];

  final int indexColor;
  final int? indexSize;

  DetailState({
    this.indexColor = 0,
    this.indexSize,
  });

  DetailState copyWith({int? indexColor, int? indexSize}) {
    return DetailState(
      indexColor: indexColor ?? this.indexColor,
      indexSize: indexSize ?? this.indexSize,
    );
  }
}
