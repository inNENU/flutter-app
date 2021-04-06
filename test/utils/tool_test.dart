import 'package:innenu/utils/tool.dart';

import 'package:test/test.dart';

enum _Test1 { a, b, c, aBC, d12 }

void main() {
  final map1 = Tool.string2EnumMap(_Test1.values);
  test('Should handle Enum correctly', () {
    expect(map1('a'), equals(_Test1.a));
    expect(map1('b'), equals(_Test1.b));
    expect(map1('c'), equals(_Test1.c));
    expect(map1('aBC'), equals(_Test1.aBC));
    expect(map1('d12'), equals(_Test1.d12));
  });

  test('Should return the first Enum value when with wrong given String', () {
    expect(map1('d'), equals(_Test1.a));
  });

  final map2 = Tool.string2EnumMap(_Test1.values, defaultValue: _Test1.d12);

  test('Should return the correct Enum value when providing a defaultValue',
      () {
    expect(map2('d'), equals(_Test1.d12));
  });

  test('Should be able to handle null and empty string.', () {
    expect(map1(null), equals(_Test1.a));
    expect(map2(''), equals(_Test1.d12));
  });
}
