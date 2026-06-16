import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('KpMascot', () {
    testWidgets('renders the mascot image from the package', (tester) async {
      await tester.pumpApp(const Scaffold(body: KpMascot()));

      final image = tester.widget<Image>(find.byType(Image));
      final provider = image.image as AssetImage;
      expect(provider.assetName, 'assets/images/mr_k_wave.png');
      expect(provider.package, 'design_system');
      expect(image.semanticLabel, 'Mr K');
    });

    testWidgets('mood constructors set the requested size', (tester) async {
      await tester.pumpApp(const Scaffold(body: KpMascot.celebrate(size: 64)));
      final image = tester.widget<Image>(find.byType(Image));
      expect(image.width, 64);
    });
  });
}
