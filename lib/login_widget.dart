import 'dart:async';

import 'package:flutter/material.dart';
import 'package:login_widget/login_error_message.dart';
import 'package:login_widget/login_form_widget.dart';

/// The root login widget to display.
class LoginWidget extends StatefulWidget {
  /// A [LoginFormWidget] which holds all of the login fields.
  final LoginFormWidget form;

  /// The text to display on the login button.
  final String loginButtonText;

  /// Gets called when the user presses submit.
  ///
  /// Returns an error message, if applicable.
  final FutureOr<String?> Function() onSubmit;

  /// Gets called when the user long presses on the submit button.
  ///
  /// Returns an error message, if applicable.
  final FutureOr<String?> Function()? onLongPress;

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
  String? errorMessage;

  /// Sets the loading status if it is supported to [value].
  ///
  /// Also refreshes the state if applicable.
  void setLoadingState(bool value) {
    if (widget.showLoadingSpinner) {
      setState(() => isLoading = value);
    }
  }

  /// Sets the error message if it has changed.
  ///
  /// Also refreshes the state.
  void setErrorMessage(String? message) {
    if (errorMessage != message) {
      setState(() => errorMessage = message);
    }
  }

  /// Clears the error message.
  ///
  /// Also refreshes the state.
  void clearErrorMessage() => setErrorMessage(null);

  /// If the input is valid, report a login attempt.
  void submitLoginInfo() async {
    clearErrorMessage();

    if (widget.form.formKey.currentState!.validate()) {
      setLoadingState(true);
      final newErrorMessage = await widget.onSubmit();
      setLoadingState(false);
      setErrorMessage(newErrorMessage);
    }
  }

  /// If the input is valid, report a long press attempt.
  void submitLoginInfoLongPress() async {
    clearErrorMessage();

    if (widget.onLongPress == null) {
      return;
    }

    if (widget.form.formKey.currentState!.validate()) {
      setLoadingState(true);
      final newErrorMessage = await widget.onLongPress!();
      setLoadingState(false);
      setErrorMessage(newErrorMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!isLoading) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LoginErrorMessage(message: errorMessage),
          widget.form,
          Padding(
            padding: const EdgeInsets.all(8),
            child: ElevatedButton(
              onPressed: submitLoginInfo,
              onLongPress: widget.onLongPress,
              child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(widget.loginButtonText)),
            ),
          ),
        ],
      );
    } else {
      return const CircularProgressIndicator();
    }
  }
}
