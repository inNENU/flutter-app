import 'package:flutter/material.dart';

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
    @required String content,
    String title = '',
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
