import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login_widget/login_field_widget.dart';
import 'package:login_widget/login_form_widget.dart';
import 'package:login_widget/login_widget.dart';

void main() {
  testWidgets('Login form', (widgetTester) async {
    final formKey = GlobalKey<FormState>();
    final textController = TextEditingController();

    await widgetTester.pumpWidget(MaterialApp(
      home: Material(
        child: LoginWidget(
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
          onSubmit: () async => null,
        ),
      ),
    ));

    expect(find.text('Hint'), findsOneWidget);
    expect(find.text('Log in'), findsOneWidget);
  });
}
