import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login_widget/login_error_message.dart';

void main() {
  group('Login error message', () {
    testWidgets('Message provided', (widgetTester) async {
      await widgetTester.pumpWidget(
        const MaterialApp(
          home: Material(child: LoginErrorMessage(message: 'Example error')),
        ),
      );

      expect(find.text('Example error'), findsOneWidget);
    });

    testWidgets('Message not provided', (widgetTester) async {
      await widgetTester.pumpWidget(
        const MaterialApp(
          home: Material(
            child: LoginErrorMessage(message: null),
          ),
        ),
      );

      expect(
        find.byWidgetPredicate(
          (widget) => widget is Visibility && !widget.visible,
        ),
        findsOneWidget,
      );
    });
  });
}
