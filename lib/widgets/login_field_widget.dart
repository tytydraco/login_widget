import 'package:flutter/material.dart';
import 'package:login_widget/widgets/login_widget.dart';

/// Single text field for use with [LoginWidget]
class LoginFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  
  const LoginFieldWidget({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
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
    );
  }
}
