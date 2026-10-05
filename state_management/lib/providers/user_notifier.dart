// Notifier
// 1st manual
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../model/user.dart';

// class UserNotifier extends Notifier<List<User>> {
//   // initial value cho data của state
//   @override
//   List<User> build() {
//     return [];
//   }
//
//   // có các p/thức để thao tác trên state
//   void fetchUsers() async {
//     // http
//     // get api https://jsonplaceholder.typicode.com/users
//     final response = await http.get(
//       Uri.parse('https://jsonplaceholder.typicode.com/users'),
//     );
//     if (response.statusCode == 200) {
//       List<dynamic> list = jsonDecode(response.body);
//       List<User> users = list.map((json) {
//         return User.fromJson(json);
//       }).toList();
//       // cap nhat lai state
//       state = users;
//       // state.add(user) ??
//     }
//   }
//
//   void clear() {
//     state = [];
//     // Question: Why not state.clear();
//     //print('State b4');
//     //print(state);
//     //state.clear();
//     //print('State after');
//     //print(state);
//   }
// }
//
// // khai báo một notifier provider tên là userNotifierProvider
// final userNotifierProvider = NotifierProvider<UserNotifier, List<User>>(() {
//   return UserNotifier();
// });

// 2nd build runner
part 'user_notifier.g.dart';

@riverpod
// Naming convention
// class name:                UserNotifier
// Bo suffix 'Notifier'       user
// Them suffix 'Provider'     userProvider
class UserNotifier extends _$UserNotifier {
  @override
  List<User> build() {
    return [];
  }

  // có các p/thức để thao tác trên state
  void fetchUsers() async {
    // http
    // get api https://jsonplaceholder.typicode.com/users
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
    );
    if (response.statusCode == 200) {
      List<dynamic> list = jsonDecode(response.body);
      List<User> users = list.map((json) {
        return User.fromJson(json);
      }).toList();
      // cap nhat lai state
      state = users;
      // state.add(user) ??
    }
  }

  void clear() {
    state = [];
  }
}

// Dependent provider
@riverpod
int totalUsers(ref) {
  final users = ref.watch(userProvider);
  return users.length;
}
