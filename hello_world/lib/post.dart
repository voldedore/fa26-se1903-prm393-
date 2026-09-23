class Post {
  int _userId;
  int id;
  String title;
  String body;

  Post(this._userId, this.id, this.title, this.body);

  int get userId => _userId;

  set userId(int value) {
    _userId = value;
  }

  // toJson

  // fromJson (constructor)
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(json['userId'], json['id'], json['title'], json['body']);
  }

  String printInfo() {
    return 'Post{_userId: $_userId, id: $id, title: $title, body: $body}';
  }
}