import 'dart:math';

class RandomRange {
  const RandomRange();

  static int integer(int min, int max) =>
      min + Random().nextInt((max + 1) - min);
}
