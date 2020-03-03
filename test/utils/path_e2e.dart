import 'package:flutter_test/flutter_test.dart';
import 'package:innenu/utils/path.dart';
import 'package:e2e/e2e.dart';

void main() {
  E2EWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Can get temporary directory', (tester) async {
    final tempPath = await Path.tempPath;

    expect(tempPath, isNotEmpty);
  });
}
