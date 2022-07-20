import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login_widget/login_form_widget.dart';

void main() {
  group('Login form widget', () {
    testWidgets('Form exists', (widgetTester) async {
      await widgetTester.pumpWidget(
        MaterialApp(
          home: Material(
            child: LoginFormWidget(
              formKey: GlobalKey<FormState>(),
              loginFields: const [],
            ),
          ),
        ),
      );

      expect(find.byType(Form), findsOneWidget);
    });

    testWidgets('Form key attached', (widgetTester) async {
      final formKey = GlobalKey<FormState>();

      await widgetTester.pumpWidget(
        MaterialApp(
          home: Material(
            child: LoginFormWidget(
              formKey: formKey,
              loginFields: const [],
            ),
          ),
        ),
      );

      expect(
        find.byWidgetPredicate(
          (widget) => widget is Form && widget.key == formKey,
        ),
        findsOneWidget,
      );
    });
  });
}
