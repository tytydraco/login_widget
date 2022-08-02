import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login_widget/login_widget.dart';

void main() {
  group('Login form', () {
    testWidgets('Buttons exist', (widgetTester) async {
      final formKey = GlobalKey<FormState>();

      await widgetTester.pumpWidget(
        MaterialApp(
          home: Material(
            child: LoginWidget(
              form: LoginFormWidget(
                formKey: formKey,
                loginFields: const [],
              ),
              loginButtonText: 'Log in',
            ),
          ),
        ),
      );

      expect(find.text('Log in'), findsOneWidget);
    });

    testWidgets('Bad input validation', (widgetTester) async {
      final formKey = GlobalKey<FormState>();
      final textController = TextEditingController();

      await widgetTester.pumpWidget(
        MaterialApp(
          home: Material(
            child: LoginWidget(
              form: LoginFormWidget(
                formKey: formKey,
                loginFields: [
                  LoginFieldWidget(
                    controller: textController,
                    hintText: 'Hint',
                    validator: (input) {
                      if (input == 'bad') {
                        return 'Bad input found';
                      } else {
                        return null;
                      }
                    },
                  )
                ],
              ),
              loginButtonText: 'Log in',
              onSubmit: () => null,
            ),
          ),
        ),
      );

      await widgetTester.enterText(find.byType(TextFormField), 'bad');
      await widgetTester.tap(find.text('Log in'));
      await widgetTester.pumpAndSettle();

      expect(find.text('Bad input found'), findsOneWidget);
    });

    testWidgets('Loading spinner', (widgetTester) async {
      final formKey = GlobalKey<FormState>();
      final textController = TextEditingController();

      await widgetTester.pumpWidget(
        MaterialApp(
          home: Material(
            child: LoginWidget(
              showLoadingSpinner: true,
              form: LoginFormWidget(
                formKey: formKey,
                loginFields: [
                  LoginFieldWidget(
                    controller: textController,
                    hintText: 'Hint',
                  )
                ],
              ),
              loginButtonText: 'Log in',
              onSubmit: () async {
                await Future<void>.delayed(const Duration(seconds: 1));
                return null;
              },
            ),
          ),
        ),
      );

      await widgetTester.enterText(find.byType(TextFormField), 'bad');
      await widgetTester.tap(find.text('Log in'));
      await widgetTester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      await widgetTester.pumpAndSettle();
    });

    testWidgets('On tap', (widgetTester) async {
      final completer = Completer<void>();
      final formKey = GlobalKey<FormState>();

      await widgetTester.pumpWidget(
        MaterialApp(
          home: Material(
            child: LoginWidget(
              form: LoginFormWidget(
                formKey: formKey,
                loginFields: const [],
              ),
              loginButtonText: 'Log in',
              onSubmit: () {
                completer.complete();
                return null;
              },
            ),
          ),
        ),
      );

      await widgetTester.tap(find.text('Log in'));
      await expectLater(completer.future, completes);
    });

    testWidgets('On long press', (widgetTester) async {
      final completer = Completer<void>();
      final formKey = GlobalKey<FormState>();

      await widgetTester.pumpWidget(
        MaterialApp(
          home: Material(
            child: LoginWidget(
              form: LoginFormWidget(
                formKey: formKey,
                loginFields: const [],
              ),
              loginButtonText: 'Log in',
              onSubmit: () => null,
              onLongPress: () {
                completer.complete();
                return null;
              },
            ),
          ),
        ),
      );

      await widgetTester.longPress(find.text('Log in'));
      await expectLater(completer.future, completes);
    });
  });
}
