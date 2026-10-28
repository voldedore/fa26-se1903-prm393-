import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jwt_intro/providers/providers.dart';
import 'package:jwt_intro/ui/home_screen.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              spacing: 20,
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Username'),
                  controller: _usernameController,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  controller: _passwordController,
                ),
                FilledButton.icon(
                  onPressed: () {
                    final authService = ref.read(authServiceProvider);
                    final authAsyncVal = authService.login(
                      _usernameController.text,
                      _passwordController.text,
                    );
                    // authAsyncVal là Future của User (login() là async)
                    authAsyncVal
                        .then((user) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                        })
                        .catchError((err) {
                          // Snackbar Login failed
                          print(err);
                        });
                  },
                  label: Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
