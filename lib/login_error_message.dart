import 'package:flutter/material.dart';

class LoginErrorMessage extends StatefulWidget {
  final String? message;

  const LoginErrorMessage({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  State<LoginErrorMessage> createState() => _LoginErrorMessageState();
}

class _LoginErrorMessageState extends State<LoginErrorMessage> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.message != null,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Text(
          widget.message ?? "",
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
