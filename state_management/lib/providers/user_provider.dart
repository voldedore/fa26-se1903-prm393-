import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:state_management/model/user.dart';


// 1st way: Manually declare a Provider
// Giả sử sẽ trả về 1 danh sách cứng
// final userProvider = Provider((ref) {
//   List<User> users = [
//     User(id: 1, name: 'Jon', username: 'jon', email: 'jon@fpt.com'),
//     User(id: 2, name: 'Jon2', username: 'jo2n', email: 'jon2@fpt.com'),
//     User(id: 3, name: 'Jon3', username: 'jon3', email: 'jon3@fpt.com'),
//     User(id: 4, name: 'Jon4', username: 'jon4', email: 'jon4@fpt.com'),
//     User(id: 5, name: 'Jon5', username: 'jon5', email: 'jon5@fpt.com'),
//     User(id: 6, name: 'Jon6', username: 'jon6', email: 'jon6@fpt.com'),
//     User(id: 7, name: 'Jon6', username: 'jon6', email: 'jon6@fpt.com'),
//     User(id: 8, name: 'Jon6', username: 'jon6', email: 'jon6@fpt.com'),
//     User(id: 9, name: 'Jon6', username: 'jon6', email: 'jon6@fpt.com'),
//   ];
//   return users;
// });

// 2nd Generate Provider bằng tool build runner
// Annotation @riverpod là dấu hiệu để build runner tìm và sinh provider
// Naming convention: tên fn + "Provider"
// Lưu ý: part có ý nghĩa là code trong file hiện tại còn 1 phần nữa trong part
// dùng lệnh: dart run build_runner build
part 'user_provider.g.dart';

@riverpod
List<User> user(ref) {
  return [
    User(id: 1, name: 'Jon', username: 'jon', email: 'jon@fpt.com'),
    User(id: 2, name: 'Jon2', username: 'jo2n', email: 'jon2@fpt.com'),
    User(id: 3, name: 'Jon3', username: 'jon3', email: 'jon3@fpt.com'),
    User(id: 4, name: 'Jon4', username: 'jon4', email: 'jon4@fpt.com'),
    User(id: 5, name: 'Jon5', username: 'jon5', email: 'jon5@fpt.com'),
    User(id: 6, name: 'Jon6', username: 'jon6', email: 'jon6@fpt.com'),
    User(id: 7, name: 'Jon6', username: 'jon6', email: 'jon6@fpt.com'),
    User(id: 8, name: 'Jon6', username: 'jon6', email: 'jon6@fpt.com'),
    User(id: 9, name: 'Jon6', username: 'jon6', email: 'jon6@fpt.com'),
  ];
}