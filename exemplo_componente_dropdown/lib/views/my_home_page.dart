import 'dart:developer';

import 'package:exemplo_componente_dropdown/components/components.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {

  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _selectedValue = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Valor escolhido na combo -> $_selectedValue',
            ),
            ComponentDropdown(
              child: const Text('Selecione uma opção'),
              items: [
                'item 1',
                'item 2',
                'item 3',
                'item 4',
              ].asMap().entries.map((item) => DropdownItem<int>(
                  value: item.key + 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(item.value),
                  ),
                ),
              ).toList(),
              dropdownStyle: DropdownStyle(
                borderRadius: BorderRadius.circular(8),
                elevation: 6,
                padding: const EdgeInsets.all(5),
              ),
              dropdownButtonStyle: const DropdownButtonStyle(
                padding: EdgeInsets.all(2),
                width: 170,
                height: 40,
                elevation: 1,
                primaryColor: Colors.black87,
                backgroundColor: Colors.white,
                mainAxisAlignment: MainAxisAlignment.start,
              ),
              // icon: IconData(),
              onChange: (int value, int index) {
                setState(() {
                  log("valor escolhido: $value");
                  _selectedValue = value;
                });
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          log("valor escolhido: $_selectedValue");
        },
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
