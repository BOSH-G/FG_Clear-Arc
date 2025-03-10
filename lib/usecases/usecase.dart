class User {
  final String name;
  final String email;

  User({required this.name, required this.email});

  // من عندك: لو عايز تعمل method علشان تحول الـ User لـ Map أو العكس
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
    };
  }
}
