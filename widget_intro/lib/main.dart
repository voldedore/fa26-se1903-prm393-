import 'package:flutter/material.dart';

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
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _txtVal = '';
  int _radioValue = 1;
  bool? _isChecked = false;
  double _sliderVal = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: .center,
              children: [
                Text('List of widgets'),
                Divider(),
                TextField(
                  decoration: InputDecoration(
                    // labelText: 'Username',
                    label: Text('Username'),
                    hintText: 'Enter your username',
                  ),
                  onChanged: (v) => setState(() {
                    _txtVal = v;
                  }),
                  keyboardType: TextInputType.phone,
                ),
                Text('You have typed: $_txtVal'),
                Card(
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Radio<int>(
                              value: 1,
                              groupValue: _radioValue,
                              onChanged: (val) {
                                setState(() {
                                  _radioValue = val!;
                                });
                              },
                            ),
                            const Text('so 1'),
                            Radio<int>(
                              value: 2,
                              groupValue: _radioValue,
                              onChanged: (val) {
                                setState(() {
                                  _radioValue = val!;
                                });
                              },
                            ),
                            const Text('so 2'),
                            Radio<int>(
                              value: 3,
                              groupValue: _radioValue,
                              onChanged: (val) {
                                setState(() {
                                  _radioValue = val!;
                                });
                              },
                            ),
                            const Text('so 3'),
                          ],
                        ),
                        Text('dang chon radio : $_radioValue'),
                      ],
                    ),
                  ),
                ),

                Divider(),
                Text('Checkbox'),
                Checkbox(
                  value: _isChecked,
                  onChanged: (bool? v) => setState(() {
                    _isChecked = v ?? false;
                  }),
                ),
                Text('You have checked: $_isChecked'),
                Divider(),
                Text('Slider'),
                Slider(value: _sliderVal, onChanged: (v) => {setState(() {
                  _sliderVal = v;
                })}),
                Text('Slider value: $_sliderVal'),
                Divider(),
                Text('Switch'),
                Text('Switch value'),
                Divider(),
                Text('Dropdown'),
                Text('Dropdown value'),
              ],
            ),
          ),
        ),
      ),

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
      ),
    );
  }
}
