import 'dart:async';

import 'package:flutter/material.dart';
import 'package:login_widget/src/login_error_message.dart';
import 'package:login_widget/src/login_form_widget.dart';

/// The root login widget to display.
class LoginWidget extends StatefulWidget {
  /// Create a new [LoginWidget] given a [form] and some [loginButtonText].
  const LoginWidget({
    super.key,
    required this.form,
    required this.loginButtonText,
    this.onSubmit,
    this.onLongPress,
    this.showLoadingSpinner = false,
  });

  /// A [LoginFormWidget] which holds all of the login fields.
  final LoginFormWidget form;

  /// The text to display on the login button.
  final String loginButtonText;

  /// Gets called when the user presses submit.
  ///
  /// Returns an error message, if applicable.
  final FutureOr<String?> Function()? onSubmit;

  /// Gets called when the user long presses on the submit button.
  ///
  /// Returns an error message, if applicable.
  final FutureOr<String?> Function()? onLongPress;

  /// Shows a indefinite circular spinner awaiting [onSubmit] or [onLongPress].
  final bool showLoadingSpinner;

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  bool _isLoading = false;
  String? _errorMessage;

  /// Sets the loading status if it is supported to [value].
  ///
  /// Also refreshes the state if applicable.
  void _setLoadingState(bool value) {
    if (widget.showLoadingSpinner) {
      setState(() => _isLoading = value);
    }
  }

  /// Sets the error message if it has changed and refreshes the state.
  void _setErrorMessage(String? message) {
    if (_errorMessage != message) {
      setState(() => _errorMessage = message);
    }
  }

  /// Clears the error message and refreshes the state.
  void _clearErrorMessage() => _setErrorMessage(null);

  /// If the input is valid, report a login attempt.
  Future<void> _submitLoginInfo() async {
    _clearErrorMessage();

    if (widget.onSubmit == null) {
      return;
    }

    if (widget.form.formKey.currentState!.validate()) {
      _setLoadingState(true);
      final newErrorMessage = await widget.onSubmit!();
      _setLoadingState(false);
      _setErrorMessage(newErrorMessage);
    }
  }

  /// If the input is valid, report a long press attempt.
  Future<void> _submitLoginInfoLongPress() async {
    _clearErrorMessage();

    if (widget.onLongPress == null) {
      return;
    }

    if (widget.form.formKey.currentState!.validate()) {
      _setLoadingState(true);
      final newErrorMessage = await widget.onLongPress!();
      _setLoadingState(false);
      _setErrorMessage(newErrorMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isLoading) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LoginErrorMessage(_errorMessage),
          widget.form,
          Padding(
            padding: const EdgeInsets.all(8),
            child: ElevatedButton(
              onPressed: _submitLoginInfo,
              onLongPress: _submitLoginInfoLongPress,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(widget.loginButtonText),
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
