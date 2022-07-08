import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: "Email address",
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Username',
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  RaisedButton(
                    onPressed: () {},
                    child: const Text('Login'),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: const Text("Create new account"),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
