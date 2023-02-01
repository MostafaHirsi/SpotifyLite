part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();
}

class SearchInitial extends SearchState {
  @override
  List<Object?> get props => [];
}

class SearchSuccess extends SearchState {
  final SearchResult searchResult;

  SearchSuccess(this.searchResult);
  @override
  List<Object?> get props => [searchResult];
}

class SearchError extends SearchState {
  final String error;
  const SearchError(this.error);
  @override
  List<Object?> get props => [error];
}
