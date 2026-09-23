import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _pwdController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _pwdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(label: Text('Username')),
                onChanged: (v) {},
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter username';
                  }
                  return null;
                },
                controller: _usernameController,
              ),
              TextFormField(
                decoration: InputDecoration(label: Text('Password')),
                obscureText: true,
                onChanged: (v) {},
                validator: (value) {

                },
                controller: _pwdController,
              ),
              ElevatedButton(onPressed: () {
                print(_usernameController.text);
                if (_formKey.currentState!.validate()) {
                  print('valid');
                  // Xu ly khi dnag nhap thanh cong
                  // Router
                } else {
                  print('invalid');
                  // Login fail
                }
              }, child: Text('Login'))
            ],
          ),
        )
      ],
    );
  }
}
