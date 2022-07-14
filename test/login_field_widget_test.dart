import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login_widget/login_field_widget.dart';

void main() {
  testWidgets('Login field widget', (widgetTester) async {
    final textController = TextEditingController();

    await widgetTester.pumpWidget(MaterialApp(
      home: Material(
        child: LoginFieldWidget(
          controller: textController,
          hintText: 'Example field',
          validator: (input) {
            if (input?.isEmpty == true) {
              return 'Cannot be empty';
            } else {
              return null;
            }
          },
        ),
      ),
    ));
  });
}
