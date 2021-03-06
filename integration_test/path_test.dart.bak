import 'package:flutter_test/flutter_test.dart';
import 'package:innenu/utils/path.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Can get temporary directory', (tester) async {
    final tempPath = await Path.tempPath;

    expect(tempPath, isNotEmpty);
  });
}
