class UserModel {
  final String email;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String password;

  final String? token;

  UserModel({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.password,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      phoneNumber: json['phoneNumber'] as String,
      password: json['password'] as String,
      token: json['accessToken'] as String?,
    );
  }
}
