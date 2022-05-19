
class User {
  final String userId;
  final String name;
  final String email;

//<editor-fold desc="Data Methods">

  const User({
    required this.userId,
    required this.name,
    required this.email,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          runtimeType == other.runtimeType &&
          userId == other.userId &&
          name == other.name &&
          email == other.email);

  @override
  int get hashCode => userId.hashCode ^ name.hashCode ^ email.hashCode;

  @override
  String toString() {
    return 'User{' +
        ' userId: $userId,' +
        ' name: $name,' +
        ' email: $email,' +
        '}';
  }

  User copyWith({
    String? userId,
    String? name,
    String? email,
  }) {
    return User(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': this.userId,
      'name': this.name,
      'email': this.email,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      userId: map['userId'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
    );
  }

//</editor-fold>
}