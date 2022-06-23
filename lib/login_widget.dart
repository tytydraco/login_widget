import 'package:flutter/material.dart';
import 'package:login_widget/login_form_widget.dart';

/// The root login widget to display
class LoginWidget extends StatefulWidget {
  final LoginFormWidget form;
  final String loginButtonText;
  final void Function() onSubmit;
  final void Function()? onLongPress;

  const LoginWidget({
    Key? key,
    required this.form,
    required this.loginButtonText,
    required this.onSubmit,
    this.onLongPress,
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
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        widget.form,
        Padding(
          padding: const EdgeInsets.all(8),
          child: ElevatedButton(
            onPressed: _submitLoginInfo,
            onLongPress: widget.onLongPress,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(widget.loginButtonText)
            ),
          ),
        ),
      ],
    );
  }
}
