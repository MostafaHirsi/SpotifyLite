part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {}

class RetrieveAccessTokenEvent extends AuthenticationEvent {
  final Uri redirectUrl;

  RetrieveAccessTokenEvent(this.redirectUrl);
}
