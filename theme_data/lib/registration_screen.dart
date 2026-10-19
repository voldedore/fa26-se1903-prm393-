import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            'Registration now',
            // style: Theme.of(
            //   context,
            // ).textTheme.bodyMedium?.copyWith(fontSize: 24),
          ),
          FilledButton(
            onPressed: () {
              print(Theme.of(context).textTheme.bodyMedium);
            },
            // style: FilledButton.styleFrom(
            //   backgroundColor: Colors.orange,
            //   foregroundColor: Colors.deepOrange,
            // ),
            child: Text('Signup'),
          ),
        ],
      ),
    );
  }
}
