import 'package:flutter/material.dart';

class WidgetsScreen extends StatefulWidget {
  const WidgetsScreen({super.key});

  @override
  State<WidgetsScreen> createState() => _WidgetsScreenState();
}

class _WidgetsScreenState extends State<WidgetsScreen> {
  String _txtVal = '';
  int _radioValue = 1;
  bool? _checkboxVal = false;
  double _sliderVal = 0.5;
  double _sliderTwoVal = 0;
  int _radioVal = 2;


  @override
  Widget build(BuildContext context) {
    return Center(
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
              RadioGroup<int>(
                onChanged: (v) {
                  setState(() {
                    _radioVal = v!;
                  });
                },
                groupValue: _radioVal,
                child: Column(
                  children: [
                    RadioListTile(value: 1, title: Text('Option 1')),
                    RadioListTile(value: 2, title: Text('Option 2')),
                    RadioListTile(value: false, title: Text('Option 3')),
                  ],
                ),
              ),
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
              Divider(),
              Text('Checkbox'),
              // 1st approach
              ListTile(
                leading: Checkbox(
                  value: _checkboxVal,
                  onChanged: (bool? v) => setState(() {
                    _checkboxVal = v ?? false;
                  }),
                ),
                title: Text('This one is displayed as ListTile + Checkbox'),
              ),
              // 2nd approach
              CheckboxListTile(
                value: _checkboxVal,
                onChanged: (v) {
                  setState(() {
                    _checkboxVal = v!;
                  });
                },
                title: Text('This checkbox is displayed as CheckbokListTile'),
              ),
              Text('You have checked: $_checkboxVal'),
              Row(
                children: [
                  Checkbox(value: false, onChanged: (v) {}),
                  Checkbox(value: true, onChanged: (v) {}),
                  Checkbox(value: null, onChanged: (v) {}, tristate: true),
                ],
              ),
              Divider(),
              Text('Slider'),
              Slider(
                value: _sliderVal,
                onChanged: (v) => {
                  setState(() {
                    _sliderVal = v;
                  }),
                },
              ),
              Text('Slider 1 value: $_sliderVal'),
              Slider(
                value: _sliderTwoVal,
                min: 0,
                max: 50,
                divisions: 10,
                onChanged: (v) {
                  setState(() {
                    _sliderTwoVal = v;
                  });
                },
              ),
              Text('Slider 2 value: $_sliderTwoVal'),
              Divider(),
              Text('Switch'),
              Switch(value: true, onChanged: (v) {}),
              SwitchListTile(
                value: false,
                onChanged: (v) {},
                title: Text('Switch 2'),
              ),
              Text('Switch value'),
              Divider(),
              Text('Dropdown'),
              Text('Dropdown value'),
            ],
          ),
        ),
      ),
    );
  }
}

