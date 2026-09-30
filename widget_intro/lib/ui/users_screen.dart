import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:widget_intro/model/user.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  List<User> users = [];

  Future<void> fetchUsers() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
    );
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      setState(() {
        users = data.map((json) {
          return User.fromJson(json);
        }).toList();
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users list'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SafeArea(
        child:
        // GridView.count(
        //   crossAxisCount: 2,
        //   children: users.map((u) {
        //       return Card(child: Column(children: [
        //         Text(u.username),
        //         Text(u.id.toString()),
        //         Text(u.email),
        //         ]));
        //     }).toList()
        // ),

        Column(
          children: [
            ElevatedButton(onPressed: fetchUsers, child: Text('Fetch users')),
            Expanded(
              child: GridView.count(
                  crossAxisCount: 2,
                  children: users.map((u) {
                    return Card(child: Column(children: [
                      Text(u.username),
                      Text(u.id.toString()),
                      Text(u.email),
                    ]));
                  }).toList()
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: 'GridView',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'ListView'),
        ],
      ),
    );
  }
}
