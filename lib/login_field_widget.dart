import 'package:flutter/material.dart';
import 'package:login_widget/login_widget.dart';

/// Single text field for use with [LoginWidget].
class LoginFieldWidget extends StatefulWidget {
  /// The [TextEditingController] to assign this field to.
  final TextEditingController controller;

  /// An optional function to check whether the input string is valid or not.
  ///
  /// Should return the error message, or null if the input is accepted.
  final String? Function(String? input)? validator;

  /// The hint text to show when no input is given.
  final String hintText;

  /// Hides the input from the user.
  final bool obscureText;

  /// Automatically focus on this element when the widget is rendered.
  final bool autofocus;

  const LoginFieldWidget({
    Key? key,
    required this.controller,
    this.validator,
    this.hintText = '',
    this.obscureText = false,
    this.autofocus = false,
  }) : super(key: key);

  @override
  State<LoginFieldWidget> createState() => _LoginFieldWidgetState();
}

class _LoginFieldWidgetState extends State<LoginFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: TextFormField(
          autofocus: widget.autofocus,
          controller: widget.controller,
          decoration: InputDecoration(
            hintText: widget.hintText,
            border: const OutlineInputBorder(),
          ),
          obscureText: widget.obscureText,
          textInputAction: TextInputAction.next,
          validator: widget.validator),
    );
  }
}
