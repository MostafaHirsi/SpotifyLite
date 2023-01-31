class AuthenticationModel {
  final String accessToken;
  final String? refreshToken;
  final DateTime? expiryTime;

  AuthenticationModel(this.accessToken, this.refreshToken, this.expiryTime);
}
