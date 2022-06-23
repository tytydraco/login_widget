import 'package:flutter/material.dart';
import 'package:login_widget/login_field_widget.dart';

/// Form to hold a list of [LoginFieldWidget]
class LoginFieldFormWidget extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final List<LoginFieldWidget> loginFields;

  const LoginFieldFormWidget({
    Key? key,
    required this.formKey,
    required this.loginFields,
  }) : super(key: key);

  @override
  State<LoginFieldFormWidget> createState() => _LoginFieldFormWidgetState();
}

class _LoginFieldFormWidgetState extends State<LoginFieldFormWidget> {
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
