class User {
  int userId;
  int eed;
  String title;

  User({this.userId, this.eed, this.title});

  factory User.fromMap(Map json) {
    return User(userId: json['userId'], eed: json['id'], title: json['title']);
  }

  toMap() {
    return {
      'userId': userId,
      'eed': eed,
      'title': title,
    };
  }
}
