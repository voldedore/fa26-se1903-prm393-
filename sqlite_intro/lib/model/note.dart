class Note {
  final int? id;
  final String title;
  final String content;

  Note({this.id, required this.title, required this.content});

  // toJson
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content
    };
  }

  // fromJson
  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(id: json['id'], title: json['title'], content: json['content']);
  }


}