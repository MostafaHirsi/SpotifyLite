import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_lite/blocs/authentication/authentication_bloc.dart';
import 'package:spotify_lite/blocs/search/search_bloc.dart';
import 'package:spotify_lite/screens/search/widgets/search_list.dart';
import 'package:spotify_lite/widgets/textfields/search_textfield.dart';

import 'widgets/search_tag.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = "SearchScreen";

  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String selectedType = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          Color backGroundColor =
              Color((Random().nextDouble() * 0xFFFFFF).toInt())
                  .withOpacity(1.0);
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  backGroundColor.withOpacity(0.4),
                  Colors.transparent,
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  color:
                      Theme.of(context).colorScheme.background.withOpacity(0.2),
                  child: buildSearchArea(context),
                ),
                if (state is SearchSuccess) buildSearchList(state)
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildSearchList(SearchSuccess state) {
    return Flexible(
      child: SearchList(
        items: selectedType == "Albums"
            ? state.searchResult.albums.items
            : state.searchResult.artists.items,
      ),
    );
  }

  Widget buildSearchArea(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 45,
          ),
          child: buildSearchField(context),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SearchTag(
              label: "Albums",
              isSelected: selectedType == "Albums",
              onTap: () {
                setState(() {
                  selectedType = "Albums";
                });
              },
            ),
            SearchTag(
              label: "Artists",
              isSelected: selectedType == "Artists",
              onTap: () {
                setState(() {
                  selectedType = "Artists";
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  Container buildSearchField(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 20,
      ),
      child: SearchTextField(
        onSubmit: (value) {
          searchSpotify(value, context);
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
