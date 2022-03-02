import 'package:ex_mobx/model/model.dart';
import 'package:ex_mobx/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

final todoStore = TodoStore();

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(
          builder: (_) => Text(todoStore.todos.length.toString()),
        ),
      ),
      body: SizedBox(
        child: Observer(
          builder: (_) => ListView.builder(
              itemCount: todoStore.todos.length,
              itemBuilder: (context, index) {
                var todo = todoStore.todos[index];
                return Text(todo.title.toString());
              }
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var todo = Todo(
            id: 1,
            title: "xxx",
            done: false
          );
          todoStore.add(todo);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
