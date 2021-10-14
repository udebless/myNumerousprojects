import 'dart:convert';

import 'package:http/http.dart' as http;

import '../json.dart';

void main() {
  UserService().getUsers('https://jsonplaceholder.typicode.com/posts');
}

class UserService {
  
  Future<List<User>> getUsers(String url) async {
    try {
      var res = await http.get(Uri.tryParse(url));
      if (res.statusCode == 200) {
        var dataList = json.decode(res.body) as List;
        var results = dataList.map((e) => User.fromMap(e)).toList();
        return results;
      }
      return [];
    } catch (e) {
      print(e);
      return [];
    }
  }

  postUsers(String url) async {
    try {
      var res = await http.get(Uri.tryParse(url));
      print(res.body.runtimeType);
    } catch (e) {
      print(e);
    }
  }
}
