import 'package:flutter/material.dart';
import 'package:login_widget/widgets/login_field_form_widget.dart';
import 'package:login_widget/widgets/login_field_widget.dart';
import 'package:login_widget/widgets/login_widget.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: LoginWidget(
          form: LoginFieldFormWidget(
            formKey: formKey,
            loginFields: [
              LoginFieldWidget(
                controller: usernameController,
                hintText: 'Username',
                obscureText: false,
              ),
              LoginFieldWidget(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
            ],
          ),
          loginButtonText: 'Log in',
          onSubmit: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Logged in'))
            );
          },
        ),
      ),
    );
  }
}
