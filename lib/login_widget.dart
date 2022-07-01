import 'package:flutter/material.dart';
import 'package:login_widget/login_form_widget.dart';

/// The root login widget to display
class LoginWidget extends StatefulWidget {
  final LoginFormWidget form;
  final String loginButtonText;
  final Future Function() onSubmit;
  final Future Function()? onLongPress;
  final bool showLoadingSpinner;

  const LoginWidget({
    Key? key,
    required this.form,
    required this.loginButtonText,
    required this.onSubmit,
    this.onLongPress,
    this.showLoadingSpinner = false,
  }) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  bool isLoading = false;

  void setLoadingState(bool value) {
    if (widget.showLoadingSpinner) {
      setState(() => isLoading = value);
    }
  }

  void submitLoginInfo() async {
    if (widget.form.formKey.currentState!.validate()) {
      setLoadingState(true);
      await widget.onSubmit();
      setLoadingState(false);
    }
  }

  void submitLoginInfoLongPress() async {
    if (widget.onLongPress == null) {
      return;
    }

    if (widget.form.formKey.currentState!.validate()) {
      setLoadingState(true);
      await widget.onLongPress!();
      setLoadingState(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!isLoading) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          widget.form,
          Padding(
            padding: const EdgeInsets.all(8),
            child: ElevatedButton(
              onPressed: submitLoginInfo,
              onLongPress: widget.onLongPress,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(widget.loginButtonText)
              ),
            ),
          ),
        ],
      );
    } else {
      return const CircularProgressIndicator();
    }
  }
}
