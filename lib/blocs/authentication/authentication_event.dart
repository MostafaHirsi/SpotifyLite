part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent extends Equatable {}

class RetrieveAccessTokenEvent extends AuthenticationEvent {
  final Uri redirectUrl;

  RetrieveAccessTokenEvent(this.redirectUrl);

  @override
  // TODO: implement props
  List<Object?> get props => [redirectUrl];
}
