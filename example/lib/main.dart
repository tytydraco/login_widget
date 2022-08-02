import 'package:flutter/material.dart';
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
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  /// Ensure the [input] is valid.
  String? _genericValidator(String? input) {
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
              formKey: _formKey,
              loginFields: [
                LoginFieldWidget(
                  controller: _usernameController,
                  hintText: 'Username',
                  validator: _genericValidator,
                ),
                LoginFieldWidget(
                  controller: _passwordController,
                  hintText: 'Password',
                  obscureText: true,
                  validator: _genericValidator,
                ),
              ],
            ),
            loginButtonText: 'Log in',
            onSubmit: () async {
              final text = '${_usernameController.text} : '
                  '${_passwordController.text}';
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(text)));
              return null;
            },
          ),
        ),
      ),
    );
  }
}
