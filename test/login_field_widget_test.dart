import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login_widget/login_field_widget.dart';

void main() {
  group('Login field widget', () {
    testWidgets('Hint text', (widgetTester) async {
      final textController = TextEditingController();

      await widgetTester.pumpWidget(
        MaterialApp(
          home: Material(
            child: LoginFieldWidget(
              controller: textController,
              hintText: 'Example field',
            ),
          ),
        ),
      );

      expect(find.text('Example field'), findsOneWidget);
    });

    testWidgets('Controller connected', (widgetTester) async {
      final textController = TextEditingController();

      await widgetTester.pumpWidget(
        MaterialApp(
          home: Material(
            child: LoginFieldWidget(
              controller: textController,
              hintText: 'Example field',
            ),
          ),
        ),
      );

      await widgetTester.enterText(
        find.byType(LoginFieldWidget),
        'Hello world',
      );

      expect(textController.text, 'Hello world');
    });
  });
}
