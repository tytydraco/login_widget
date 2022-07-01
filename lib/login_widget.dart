import 'package:flutter/material.dart';
import 'package:login_widget/login_form_widget.dart';

/// The root login widget to display.
class LoginWidget extends StatefulWidget {
  /// A [LoginFormWidget] which holds all of the login fields.
  final LoginFormWidget form;
  /// The text to display on the login button.
  final String loginButtonText;
  /// Gets called when the user presses submit.
  final Future Function() onSubmit;
  /// Gets called when the user long presses on the submit button.
  final Future Function()? onLongPress;
  /// Shows a indefinite circular spinner awaiting [onSubmit] or [onLongPress].
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

  /// Sets the loading status if it is supported to [value].
  ///
  /// Also refreshes the state if applicable.
  void setLoadingState(bool value) {
    if (widget.showLoadingSpinner) {
      setState(() => isLoading = value);
    }
  }

  /// If the input is valid, report a login attempt.
  void submitLoginInfo() async {
    if (widget.form.formKey.currentState!.validate()) {
      setLoadingState(true);
      await widget.onSubmit();
      setLoadingState(false);
    }
  }

  /// If the input is valid, report a long press attempt.
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
