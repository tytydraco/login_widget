import 'package:flutter/material.dart';
import 'package:login_widget/login_form_widget.dart';
import 'package:login_widget/login_field_widget.dart';
import 'package:login_widget/login_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Widget Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Login Widget Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  String? genericValidator(String? input) {
    if (input == null) {
      return 'Invalid';
    } else if (input == '') {
      return 'Cannot be empty';
    } else if (input.length > 256) {
      return 'Too long';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 300),
          child: LoginWidget(
            form: LoginFormWidget(
              formKey: formKey,
              loginFields: [
                LoginFieldWidget(
                  controller: usernameController,
                  hintText: 'Username',
                  validator: genericValidator,
                ),
                LoginFieldWidget(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                  validator: genericValidator,
                ),
              ],
            ),
            loginButtonText: 'Log in',
            onSubmit: () {
              final text = '${usernameController.text} : ${passwordController.text}';
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
            },
          ),
        ),
      ),
    );
  }
}
