part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {}

class CommitSearchEvent extends SearchEvent {
  final String searchTerms;
  final AuthenticationModel authenticationModel;

  CommitSearchEvent(this.searchTerms, this.authenticationModel);

  @override
  List<Object?> get props => [searchTerms, authenticationModel];
}
