import 'package:equatable/equatable.dart';

class AuthenticationModel extends Equatable {
  final String accessToken;
  final String? refreshToken;
  final DateTime? expiryTime;

  const AuthenticationModel(
      this.accessToken, this.refreshToken, this.expiryTime);

  AuthenticationModel.fromJson(Map<String, dynamic> json)
      : accessToken = json['access_token'],
        refreshToken = json['refresh_token'],
        expiryTime = DateTime.now().add(Duration(seconds: json['expires_in']));

  @override
  List<Object?> get props => [accessToken, refreshToken, expiryTime];
}
