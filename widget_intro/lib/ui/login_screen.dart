import 'package:flutter/material.dart';
import 'package:widget_intro/ui/users_screen.dart';

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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
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
                      if (value == null || value.isEmpty) {
                        return 'Please enter password';
                      }
                      return null;
                    },
                    controller: _pwdController,
                  ),
                  ElevatedButton(onPressed: () {
                    print(_usernameController.text);
                    if (_formKey.currentState!.validate()) {
                      print('valid');
                      // Xử lý đăng nhập
                      // Do chung ta chưa có DB, nên tạm thời cho credentials cứng
                      // admin | 123456
                      if (_usernameController.text == 'admin' &&
                          _pwdController.text == '123456') {
                        // Navigator - Screen stack
                        // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (v) => const UsersScreen()));
                        // 1. Navigator.push(context, route)
                        // 2. Navigator.pushReplacement(context, newRoute)
                        // 3. Navigator.pushAndRemoveUntil(context, newRoute, predicate)
                        // 4,5,6. Push named (tương tự, chỉ khác là ta phải khai báo tên các routes ở MaterialApp())
                        Navigator.of(context).pushNamed('/users');

                        // 1) Chuyển màn hình qua 1 Scaffold
                        // 2) Trong Scaffold có Nav 2 menu: Grid, List
                        // 3) Trong màn hình Grid
                        // Có 1 button
                        // 4) Viết lớp User: Thông tin User (id, name, username, email)
                        // 5) Khi tap vào button đó, call API https://jsonplaceholder.typicode.com/users
                        // Lấy tất cả users nhận được từ API và hiển thị vào 1 GridView
                        // Grid view có 3 cột, mỗi user được hiển thị trong 1 widget Card
                        // "name [id]"
                        // @username

                        // Provider - Riverpod
                      } else {
                        // Hiển thị snackbar thông báo
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('Invalid credentials'),
                              backgroundColor: Colors.red,
                          )
                        );
                      }
                    } else {
                      print('invalid');
                      // Login fail
                    }
                  }, child: Text('Login'))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
