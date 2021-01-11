import 'package:innenu/utils/utils.dart';

Future<void> init() =>
    myNetWork.downLoadFile('resource/guide.zip').then((success) {});
