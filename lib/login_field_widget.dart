import 'package:flutter/material.dart';
import 'package:login_widget/login_widget.dart';

/// Single text field for use with [LoginWidget].
class LoginFieldWidget extends StatelessWidget {
  /// Create a new [LoginFieldWidget] given a [controller] to attach.
  const LoginFieldWidget({
    super.key,
    required this.controller,
    this.validator,
    this.hintText = '',
    this.obscureText = false,
    this.autofocus = false,
  });

  /// The [TextEditingController] to assign this field to.
  final TextEditingController controller;

  /// An optional function to check whether the input string is valid or not.
  ///
  /// Should return an error message, or null if the input is accepted.
  final String? Function(String? input)? validator;

  /// The hint text to show when no input is given.
  final String hintText;

  /// Hides the input from the user.
  final bool obscureText;

  /// Automatically focus on this element when the widget is rendered.
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: TextFormField(
        autofocus: autofocus,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: const OutlineInputBorder(),
        ),
        obscureText: obscureText,
        textInputAction: TextInputAction.next,
        validator: validator,
      ),
    );
  }
}
