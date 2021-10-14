import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:myprojects/model/post.dart';

class JsonParsingMap extends StatefulWidget {
  const JsonParsingMap({Key key}) : super(key: key);

  @override
  _JsonParsingMapState createState() => _JsonParsingMapState();
}

class _JsonParsingMapState extends State<JsonParsingMap> {
  Future<PostList> data;

  void initState() {
    super.initState();
    Network network = Network('https://jsonplaceholder.typicode.com/posts');
    data = network.loadPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PODO'),
      ),
      body: Center(
        child: Container(
          child: FutureBuilder(
            future: data,
           
              builder: (context, AsyncSnapshot<PostList> snapshot) {
                 List <Post> allPosts;
            if (snapshot.hasData) {
              allPosts = snapshot.data.posts;
              return Text('${allPosts[2].title}');
            } else {
              return CircularProgressIndicator();
            }
          }),
        ),
      ),
    );
  }
}

class Network {
  final String url;

  Network(this.url);
  Future<PostList> loadPosts() async {
    final response = await get(Uri.parse(Uri.encodeFull(url)));
    if (response.statusCode == 200) {
      //ok
      return PostList.fromJson(json.decode(response.body)); // we get json
    } else {
      throw Exception('failed to get posts');
    }
  }

  // Future fetchData() async {
  //   print('$url');
  //   Response response = await get(Uri.parse(Uri.encodeFull(url)));
  //   if (response.statusCode == 200) {
  //     // print(response.body[0]);
  //     return json.decode(response.body);
  //   } else
  //     print(response.statusCode);
  // }
}
