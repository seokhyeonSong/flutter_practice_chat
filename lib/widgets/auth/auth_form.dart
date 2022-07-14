import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formkey = GlobalKey<FormState>();
  var _isLogin = true;
  var _userEmail = '';
  var _userName = '';
  var _userPassword = '';

  void _trySubmit() {
    if (_formkey.currentState == null) return;
    final isValid = _formkey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formkey.currentState!.save();
      // User those values to send our auth request ...
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    key: ValueKey('email'),
                    validator: (value) {
                      if (value == null)
                        return 'Please enter a valid email address';
                      if (value.isEmpty || !value.contains('@'))
                        return 'Please enter a valid email address';
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: "Email address",
                    ),
                    onSaved: (value) {
                      if (value != null) _userEmail = value;
                    },
                  ),
                  if (!_isLogin)
                    TextFormField(
                      key: ValueKey('username'),
                      validator: (value) {
                        if (value == null)
                          return 'Please enter at least 4 characters.';
                        if (value.isEmpty || value.length < 4)
                          return 'Please enter at least 4 characters.';
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Username',
                      ),
                      onSaved: (value) {
                        if (value != null) _userName = value;
                      },
                    ),
                  TextFormField(
                    key: ValueKey('password'),
                    validator: (value) {
                      if (value == null)
                        return 'Password must be at least 7 characters long.';
                      if (value.isEmpty || value.length < 7)
                        return 'Password must be at least 7 characters long.';
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                    onSaved: (value) {
                      if (value != null) _userPassword = value;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  RaisedButton(
                    onPressed: _trySubmit,
                    child: Text(_isLogin ? 'Login' : 'Sign up'),
                  ),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    onPressed: () {
                      setState(() {
                        _isLogin = !_isLogin;
                      });
                    },
                    child: Text(_isLogin
                        ? "Create new account"
                        : "i already have an account"),
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
