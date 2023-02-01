import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_lite/blocs/authentication/authentication_bloc.dart';
import 'package:spotify_lite/blocs/search/search_bloc.dart';
import 'package:spotify_lite/widgets/textfields/search_textfield.dart';

class SearchScreen extends StatelessWidget {
  static const String routeName = "SearchScreen";

  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          return Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 14,
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    bottom: 20,
                  ),
                  child: SearchTextField(
                    onSubmit: (value) {
                      searchSpotify(value, context);
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  searchSpotify(String searchTerms, BuildContext context) {
    AuthenticationBloc authenticationBloc = BlocProvider.of(context);
    if (authenticationBloc.state is RetrieveAccessTokenSuccess) {
      RetrieveAccessTokenSuccess retrieveAccessTokenSuccess =
          authenticationBloc.state as RetrieveAccessTokenSuccess;
      SearchBloc searchBloc = BlocProvider.of(context);
      searchBloc.add(CommitSearchEvent(
          searchTerms, retrieveAccessTokenSuccess.authenticationModel));
    }
  }
}
