import 'package:flutter/material.dart';

/// Display a [Text] with a [message] (if [message] is not null).
class LoginErrorMessage extends StatelessWidget {
  /// Create a new [LoginErrorMessage] with the given [message].
  const LoginErrorMessage(
    this.message, {
    super.key,
  });

  /// The optional text to display.
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: message != null,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Text(
          message ?? '',
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
