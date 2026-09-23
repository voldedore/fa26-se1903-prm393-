// Parameters
// - required
// - Named parameters {}
// - Optional []
// - default value =
import 'dart:convert';
import 'dart:math';

import 'package:hello_world/animal.dart';
import 'package:hello_world/post.dart';
import 'package:http/http.dart' as http;

void greet(String fullName, int age) { // Mặc định, viết kiểu này là phải truyền (required)
    print("Hello $fullName, you are $age years old");
}
// [] = optional; ? cho phep null ; = default value
void greet2(String fullName, [int? age,  int gender = 0]) {
  print("Hello $fullName, you are $age years old, gender: $gender");
}
// {} named param ; từ khóa required = buộc phải truyền
// Đối với named param, thì theo thiết kế là optional
void greet3({required String fullName, int age = 20}) {
  print("Hello $fullName, you are $age years old");
}

// Classwork1:
// Viết hàm void describe
// Nhận 2 tham số String color, String size
// Logic:
// - describe(size: 'large')
//    => In ra 'This item is blue and large
// - describe(size: 'small', color: 'red')
//    => In ra 'This item is red and small
// - describe(color: 'red')
//    => In ra 'This item is red and medium
// - describe()
//    => In ra 'This item is blue and medium

// Classwork2 (gợi ý: optional param dùng [])
// Viết hàm String fullName
// Nhận vào 3 tham số: firstName, middleName, lastName (String)
// return:
// - fullName('John') => John
// - fullName('John', 'Mark', 'Zuck') => John Mark Zuck
// - fullName('John', 'Zuck') => John Zuck


/* ------------------------- FN --------------- */
int add(int a, int b) {
  return a + b;
}
int add2(int a, int b) => a + b;

String generateMsg() => "Hi";

void sayHello() => print("ola");

// -------------- LIST SET MAP -
int age = 18;
var base = [4, 7, 9];
// ... = spread operator
var list = [...base, 8, 15, if (age > 16) 1, for (var x in base) x * 2];


void main() async {
  // greet("Jon", 18);
  // greet2("Alice"); // greet2("Alice", null);
  // greet2("Mark");
  // print("FN");
  // print("Ket qua 5 + 9");
  // print(add(5, 9));
  // print(generateMsg());
  // sayHello();
  // print(add2(8, 2));
  // print(base);
  // print(list);
  // Student s = Student("Alice", 20, 9);
  // print(s.name);
  // // s.age = 18;
  // // s.
  // // print(s.age);
  // Student s2 = Student.withAge(21);
  // // print(s2.name);
  // // print(s2.);
  //
  // // -------------- OOP
  // Post p = Post(1, 2, "title", "body");
  // // print(p.)
  //
  // Duck d = Duck("Donal", 10);
  // d.printInfo();
  // d.fly();
  // d.swim();

  // ----------- FUTURE ---------
  // Future(() => print("future1"));
  // print("A");
  // Future(() => print("future2"));
  // Future(() => print("future3"));
  // print("B");
  // Future(() => 1)
  //     .then((v) => v + 1)
  //     .then((value) => print(value));
  // Future(getOne)
  //     .then(plusOne)
  //     .then(printResult);

  // ------------ STREAM ------
  // getNumbers().listen((v) => print(v));
  await Future.delayed(const Duration(seconds: 5), () => print("Jon"));

  // API CALL
  // var p = await fetchPost(3);
  // print(p.printInfo());

  // Xo so
  luckyNumber().forEach((v) => print(v));
}
// Cho
// - hàm Random().nextInt(100) để lấy 1 số ngẫu nhiên từ 0-99 (import math).
// - await Future.delayed(const Duration(seconds: 5), () => print("Jon")); để trì hoãn 1 đoạn logic trong 1 khoảng tgian.
// Viết 1 đoạn code xổ số:
// - Cách mỗi 0.5 giây sẽ xổ 1 số. In số vừa xổ ra màn hình.
// - Nếu số may mắn được quay trúng (vd 79), in câu chúc mừng (Congrats) và kết thúc chương trình.
Stream<int> luckyNumber() async* {
  while (true) {
    await Future.delayed(const Duration(milliseconds: 250));
    int n = Random().nextInt(100);
    yield n;
    if (n == 79) {
      print("Grats");
      break;
    }
  }
}



// GET https://jsonplaceholder.typicode.com/posts/3
// Bài tập fetch API:
// Viết 1 hàm fetchPost(int id)
// - Dùng thư viện http để gọi API (GET https://jsonplaceholder.typicode.com/posts/{id}
// - return về 1 đối tượng Post có data là data nhận được từ API
// Hint1: Có thể phải điều chỉnh lại class Post tí xíu
// Hint2: Có thể phải dùng Future (bất đồng bộ)
// Trong hàm main, gọi fetchPost(3), gán vào biến `p`
// Sau đó in thông tin của bài post id 3 ra màn hình (p.printInfo())
Future<Post> fetchPost(int id) async {
  final uri = Uri.parse("https://jsonplaceholder.typicode.com/posts/$id");
  final response = await http.get(uri);
  // print(response.statusCode);
  // print(response.body);
  return Post.fromJson(jsonDecode(response.body));
}

int getOne() {
  return 1;
}
int plusOne(int v) {
  return v + 1;
}
void printResult(int value) {
  print(value);
}

Stream<int> getNumbers() async* {
  yield 5;
  yield 10;
  yield 7;
}

class Student {
  String name;
  int _age; // _ private
  int grade;
  // setter
  set age(int age) {
    if (age < 0) {
      this._age = 0;
    } else {
      this._age = age;
    }
  }
  // getter (lưu ý, khi gọi ra dùng, sử dụng như 1 thuộc tính (xem Line 76)
  int get age => _age;

  // Cách viết truyền thống
  // Student(String name, int age, int grade) {
  //   this.name = name;
  //   this._age = age;
  //   this.grade = grade;
  // }
  Student(this.name, this._age, this.grade); // Dart style
  // Student(); // Chỉ tồn tại duy nhất 1 constructor theo thiêt kế của Dart
  // Named constructor | dấu : là cho initial value
  Student.withAge(this._age) : name = "Unknown", grade = 0;

}