import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login_widget/login_field_widget.dart';
import 'package:login_widget/login_form_widget.dart';

void main() {
  testWidgets('Login field widget', (widgetTester) async {
    final formKey = GlobalKey<FormState>();
    final textController = TextEditingController();

    await widgetTester.pumpWidget(MaterialApp(
      home: Material(
        child: LoginFormWidget(
          formKey: formKey,
          loginFields: [
            LoginFieldWidget(
              controller: textController,
              hintText: 'Hint',
            )
          ],
        ),
      ),
    ));

    expect(find.text('Hint'), findsOneWidget);
  });
}
