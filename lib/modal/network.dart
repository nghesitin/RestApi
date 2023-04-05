import 'dart:convert';
import 'package:flutter_application_1/global.dart';
import 'package:flutter_application_1/modal/todo.dart';
import 'package:http/http.dart' as http;

class NetWorkResponse {
  static Future<List<Todo>> fetchTodos(http.Client client) async {
    final response =
        await client.get((Uri.parse(k_Url))); // yeu cau lay du lieu
    if (response.statusCode == 200) {
      List<dynamic> todos = json.decode(
          response.body); // chuyen mang trong file json thanh kieu list dynamic
      final listOfTodos = todos
          .map((e) => Todo.fromJson(e))
          .toList(); // anh xa tung phan tu trong list
      return listOfTodos;
    } else {
      throw Exception('Failed to load');
    }
  }
}
