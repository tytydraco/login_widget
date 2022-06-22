import 'package:flutter/material.dart';
import 'package:login_widget/widgets/login_field_widget.dart';

/// The root login widget to display
class LoginWidget extends StatefulWidget {
  final List<LoginFieldWidget> loginFields;

  const LoginWidget({
    Key? key,
    required this.loginFields
  }) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
