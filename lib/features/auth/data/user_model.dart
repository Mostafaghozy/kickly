class UserModel {
  final int userId;
  final String firstName;
  final String lastName;
  final String email;
  final int role;
  final String accessToken;
  final String? refreshToken;
  final String? accessTokenExpiresAtUtc;
  final String? refreshTokenExpiresAtUtc;

  UserModel({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.role,
    required this.accessToken,
    this.refreshToken,
    this.accessTokenExpiresAtUtc,
    this.refreshTokenExpiresAtUtc,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: (json['userId'] as num).toInt(),
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      role: (json['role'] as num).toInt(),
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String?,
      accessTokenExpiresAtUtc: json['accessTokenExpiresAtUtc'] as String?,
      refreshTokenExpiresAtUtc: json['refreshTokenExpiresAtUtc'] as String?,
    );
  }
}
