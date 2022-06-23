import 'package:flutter/material.dart';
import 'package:login_widget/login_field_widget.dart';

/// Form to hold a list of [LoginFieldWidget]
class LoginFormWidget extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final List<LoginFieldWidget> loginFields;

  const LoginFormWidget({
    Key? key,
    required this.formKey,
    required this.loginFields,
  }) : super(key: key);

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: widget.loginFields,
      ),
    );
  }
}
