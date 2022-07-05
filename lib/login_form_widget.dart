import 'package:flutter/material.dart';
import 'package:login_widget/login_field_widget.dart';

class LoginFormWidget extends StatelessWidget {
  /// A [GlobalKey] of type [FormState] to use.
  final GlobalKey<FormState> formKey;

  /// A list of type [LoginFieldWidget] that holds the input fields.
  final List<LoginFieldWidget> loginFields;

  const LoginFormWidget({
    Key? key,
    required this.formKey,
    required this.loginFields,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: loginFields,
      ),
    );
  }
}
