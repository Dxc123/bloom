
import 'package:logger/logger.dart';

class BlLogger {

  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2, // 要显示的方法调用数
      errorMethodCount: 8, //如果提供了 stacktrace，则方法调用次数
      lineLength: 120, // 输出的宽度
      colors: true, // 彩色日志消息
      printEmojis: true, // 为每个日志消息设置一个表情符号
      // 每个日志打印是否应包含时间戳
      dateTimeFormat: DateTimeFormat.none,
    ),
  );

  static void debug(String message) {
    _logger.d(message);
  }
}
