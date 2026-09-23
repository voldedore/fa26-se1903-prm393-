import 'package:flutter/material.dart';
import 'package:widget_intro/home_screen.dart';
import 'package:widget_intro/login_screen.dart';
import 'package:widget_intro/settings_screen.dart';
import 'package:widget_intro/widgets_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Widgets'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final title;
  const MyHomePage({super.key, required this.title});

  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _navBarItemIndex = 0;
  final _screens = [];

  @override
  void initState() {
    super.initState();
    _screens.add(WidgetsScreen());
    _screens.add(HomeScreen());
    _screens.add(LoginScreen());
    _screens.add(SettingsScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: _screens[_navBarItemIndex],
      // Bai tap
      // 1) Xử lý cho nav
      // - Chuyển được màn hình theo sự kiện tap của người dùng
      // Hint: cho 1 mảng nhiều screen,
      //      onTap sẽ chọn index và hiển thị đúng screen tương ứng
      // 2) Trong login screen
      // Viết form login gồm
      // Field username
      // Field password
      // Nút Login
      // Validation: Khi submit form, kiểm tra và báo lỗi nếu
      // - username rỗng
      // - password rỗng hoặc ít hơn 6 ký tự
      // Nếu user nhập 'admin' & '123456'
      // - Nếu như nhập đúng sẽ thông báo (Snackbar) Đăng nhập thành công (Next slot Routes)
      // - Nếu thất bại sẽ thông báo Invalid credentials

      bottomNavigationBar: BottomNavigationBar(
        // type: .fixed, // La viet tat cua line ben duoi
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.category), label: "Widgets"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Login"),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
        onTap: (v) {
          setState(() {
            _navBarItemIndex = v;
          });
        },
        currentIndex: _navBarItemIndex,
      ),
    );
  }
}
