class User {
  final int id;
  final String username;
  final String email;
  final String accessToken;
  final String refreshToken;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.accessToken,
    required this.refreshToken,
  });

  // fromJson
  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'],
    username: json['username'],
    accessToken: json['accessToken'],
    refreshToken: json['refreshToken'],
    email: json['email']
  );
  // toJson
  Map<String, dynamic> toJson() => {
    'id': id,
    'username': username,
    'email': email,
    'accessToken': accessToken,
    'refreshToken': refreshToken
  };
}
