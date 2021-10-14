class PostList {
  final List<Post> posts;

  PostList({this.posts});
  factory PostList.fromJson(List<dynamic> parsedJson) {
    List<Post> posts = <Post>[];
    posts = parsedJson.map((i) => Post.fromJson(i)).toList();
    return new PostList(posts: posts);
  }
}

class Post {
  int userId;
  int id;
  String title;
  String body;
  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        userId: json['userId'],
        title: json[''],
        id: json[''],
        body: json['body']);
  }
}
