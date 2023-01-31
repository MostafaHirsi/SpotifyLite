part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState extends Equatable {}

class AuthenticationInitial extends AuthenticationState {
  AuthenticationInitial();

  List<Object> get props => [];
}

class RetrieveAccessTokenSuccess extends AuthenticationState {
  final AuthenticationModel authenticationModel;

  RetrieveAccessTokenSuccess(this.authenticationModel);

  List<Object> get props => [authenticationModel];
}

class AuthenticationError extends AuthenticationState {
  final String errorMessage;

  AuthenticationError(this.errorMessage) : super();

  List<Object> get props => [errorMessage];
}
