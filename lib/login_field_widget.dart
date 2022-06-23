import 'package:flutter/material.dart';
import 'package:login_widget/login_field_validator_implementation.dart';
import 'package:login_widget/login_widget.dart';

/// Single text field for use with [LoginWidget]
class LoginFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final LoginFieldValidatorImplementation? loginFieldValidator;

  const LoginFieldWidget({
    Key? key,
    required this.controller,
    this.hintText = '',
    this.obscureText = false,
    this.loginFieldValidator,
  }) : super(key: key);

  @override
  State<LoginFieldWidget> createState() => _LoginFieldWidgetState();
}

class _LoginFieldWidgetState extends State<LoginFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          hintText: widget.hintText,
          border: const OutlineInputBorder(),
        ),
        obscureText: widget.obscureText,
        textInputAction: TextInputAction.next,
        validator: widget.loginFieldValidator?.validate,
      ),
    );
  }
}
