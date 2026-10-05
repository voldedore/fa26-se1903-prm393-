import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/model/user.dart';
import 'package:state_management/providers/user_notifier.dart';


//--------------STATELESS --------------
class UsersScreen extends ConsumerWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<User> users = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Users list')),
      body: Column(
        children: [
          ElevatedButton(onPressed: () {
            // read (lay notifier)
            ref.read(userProvider.notifier).fetchUsers();
          }, child: Text('Fetch users')),
          ElevatedButton(onPressed: () {
            // read (lay notifier)
            ref.read(userProvider.notifier).clear();
          }, child: Text('Clear')),
          Text('Total users: ${ref.watch(totalUsersProvider)}'),
          Expanded(
            // ListView
            child: GridView.count(
              crossAxisCount: 3,
              children: users.map((u) {
                return Card(
                  child: Column(
                    children: [
                      Text(u.username),
                      Text(u.id.toString()),
                      Text(u.email),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}



// ------------ STATEFUL -----------------
// class UsersScreen extends ConsumerStatefulWidget {
//   const UsersScreen({super.key});
//
//   @override
//   ConsumerState<UsersScreen> createState() => _UsersScreenState();
// }
//
// class _UsersScreenState extends ConsumerState<UsersScreen> {
//   @override
//   Widget build(BuildContext context) {
//     List<User> users = ref.watch(userProvider);
//
//     return Scaffold(
//       appBar: AppBar(title: Text('Users list')),
//       body: Column(
//         children: [
//           ElevatedButton(onPressed: null, child: Text('Fetch users')),
//           Expanded(
//             child: GridView.count(
//               crossAxisCount: 3,
//               children: users.map((u) {
//                 return Card(
//                   child: Column(
//                     children: [
//                       Text(u.username),
//                       Text(u.id.toString()),
//                       Text(u.email),
//                     ],
//                   ),
//                 );
//               }).toList(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
