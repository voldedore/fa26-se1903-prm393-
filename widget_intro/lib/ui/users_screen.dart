import 'package:flutter/material.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users list'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(onPressed: () {
              // Navigator pop
              Navigator.pop(context);
            }, child: Text('Back')),
            Text('Users list'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: 'GridView'),
        BottomNavigationBarItem(icon: Icon(Icons.list), label: 'ListView'),
      ]),
    );
  }
}
