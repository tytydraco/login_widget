import 'package:flutter/material.dart';
import 'package:login_widget/login_widget.dart';

/// Single text field for use with [LoginWidget]
class LoginFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final int maxLength;
  final bool allowEmpty;

  const LoginFieldWidget({
    Key? key,
    required this.controller,
    this.hintText = '',
    this.obscureText = false,
    this.maxLength = 256,
    this.allowEmpty = false,
  }) : super(key: key);

  @override
  State<LoginFieldWidget> createState() => _LoginFieldWidgetState();
}

class _LoginFieldWidgetState extends State<LoginFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
      ),
      obscureText: widget.obscureText,
      validator: (input) {
        if (input == null) {
          return 'Invalid';
        } else if (!widget.allowEmpty && input == '') {
          return 'Cannot be empty';
        } else if (input.length > widget.maxLength) {
          return 'Too long';
        }
        return null;
      },
    );
  }
}
