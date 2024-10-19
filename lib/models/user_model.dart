class User {
  final String avatar;
  final String fullName;
  final String preferredName;
  final String email;
  final String phoneNumber;
  final String password;

  User({
    required this.avatar,
    required this.fullName,
    required this.preferredName,
    required this.email,
    required this.phoneNumber,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'avatar': avatar,
      'fullName': fullName,
      'preferredName': preferredName,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password,
    };
  }
}
