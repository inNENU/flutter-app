import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

class UI {
  /// 弹出提示
  static void tip(
    BuildContext context, {
    @required String content,
    int duration = 3000,
    Icon icon,
    String actionLabel,
    void Function() action,
  }) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        duration: Duration(milliseconds: duration),
        content: Text(content),
        action: actionLabel != null && action != null
            ? SnackBarAction(label: '打开', onPressed: action)
            : null,
      ),
    );
  }

  /// 弹出弹窗
  static void modal<T>(
    BuildContext parentContent, {
    String title = '',
    @required String content,
    bool mask = false,
    List<Widget> actions,
  }) {
    showDialog<T>(
      context: parentContent,
      barrierDismissible: !mask,
      builder: (context) => AlertDialog(
        title: title.isEmpty ? null : Text(title),
        content: Text(content),
        actions: actions,
      ),
    );
  }
}

const defaultToastDuration = Duration(seconds: 2);
const defaultToastColor = Color(0xFF424242);

class ToastUtils {
  ToastUtils._internal();

  ///全局初始化Toast配置, child为MaterialApp
  static OKToast init(Widget child) {
    return OKToast(
      ///字体大小
      textStyle: const TextStyle(fontSize: 16, color: Colors.white),
      backgroundColor: defaultToastColor,
      radius: 10,
      dismissOtherOnShow: true,
      textPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: child,
      duration: defaultToastDuration,
    );
  }

  static void toast(String msg,
      {Duration duration = defaultToastDuration,
      Color color = defaultToastColor}) {
    showToast(msg, duration: duration, backgroundColor: color);
  }

  static void warning(String msg, {Duration duration = defaultToastDuration}) {
    showToast(msg, duration: duration, backgroundColor: Colors.yellow);
  }

  static void error(String msg, {Duration duration = defaultToastDuration}) {
    showToast(msg, duration: duration, backgroundColor: Colors.red);
  }

  static void success(String msg, {Duration duration = defaultToastDuration}) {
    showToast(msg, duration: duration, backgroundColor: Colors.lightGreen);
  }
}
