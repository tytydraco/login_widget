import 'package:flutter/material.dart';
import 'package:login_widget/login_field_form_widget.dart';

/// The root login widget to display
class LoginWidget extends StatefulWidget {
  final LoginFieldFormWidget form;
  final String loginButtonText;
  final Function onSubmit;

  const LoginWidget({
    Key? key,
    required this.form,
    required this.loginButtonText,
    required this.onSubmit,
  }) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  void _submitLoginInfo() {
    if (widget.form.formKey.currentState!.validate()) {
      widget.onSubmit();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.form,
        Padding(
          padding: const EdgeInsets.all(8),
          child: ElevatedButton(
            onPressed: _submitLoginInfo,
            child: Text(widget.loginButtonText),
          ),
        ),
      ],
    );
  }
}
