import 'package:flutter/material.dart';
import 'package:login_widget/login_field_widget.dart';

/// Holds a list of [loginFields] in a [Form] given a [formKey] to use.
class LoginFormWidget extends StatelessWidget {
  /// Create a new [LoginFormWidget] given a [formKey] and some [loginFields].
  const LoginFormWidget({
    super.key,
    required this.formKey,
    required this.loginFields,
  });

  /// A [GlobalKey] of type [FormState] to use.
  final GlobalKey<FormState> formKey;

  /// A list of type [LoginFieldWidget] that holds the input fields.
  final List<LoginFieldWidget> loginFields;

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
