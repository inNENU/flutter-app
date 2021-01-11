import 'package:logging/logging.dart';

final _logger = Logger('utils.tool');

class Tool {
  /// 建立 String 到 Enum 的映射
  static T Function(String) string2EnumMap<T>(
    List<T> enumValues, {
    T defaultValue,
  }) {
    final map = <String, T>{};

    for (final enumValue in enumValues) {
      map[enumValue.toString().split('.')[1]] = enumValue;
    }

    return (enumString) {
      if (map[enumString] != null) {
        return map[enumString];
      }
      final defaultEnum = defaultValue ?? enumValues[0];
      final logMessage = defaultValue == null
          ? 'the first value $defaultEnum'
          : 'the default value ${defaultValue.toString()}';

      _logger.warning(
          'Illigal value $enumString, and will return the $logMessage');

      return defaultEnum;
    };
  }
}
