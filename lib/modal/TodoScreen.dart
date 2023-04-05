import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'network.dart';
import 'todo.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fetch Todos from Restful Api"),
      ),
      body: FutureBuilder(
          future: NetWorkResponse.fetchTodos(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);
            }
            return snapshot.hasData
                ? TodoList(todos: snapshot.data!)
                : const Center(
                    child: CircularProgressIndicator(),
                  );
          }),
    );
  }
}

class TodoList extends StatelessWidget {
  const TodoList({super.key, required this.todos});
  final List<Todo> todos;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Container(
              padding: const EdgeInsets.all(10),
              color: index % 2 == 0 ? Colors.greenAccent : Colors.cyan,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(todos[index].id.toString()),
                  Text(todos[index].title!)
                ],
              ),
            ),
          );
        });
  }
}
