import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:spotify_lite/models/authentication.dart';
import 'package:spotify_lite/models/spotify/search_result.dart';

class SpotifyService {
  final String clientId = "7da524d167a54367b2c3affe05efb59a";
  final String clientSecret = "3e337cef22064758b44c3286f9ec33dc";
  final Dio dio = Dio();
  Future<AuthenticationModel> getUserAuthenticatedSpotifyApi(
      String code) async {
    String basicAuth =
        'Basic ${base64.encode(utf8.encode('$clientId:$clientSecret'))}';

    dio.options.headers['content-type'] = 'application/x-www-form-urlencoded';
    Response response = await dio.post(
      'https://accounts.spotify.com/api/token',
      data: {
        'code': code,
        'grant_type': 'authorization_code',
        'redirect_uri': 'http://localhost:8888'
      },
      options: Options(
        headers: {'Authorization': basicAuth},
        contentType: Headers.formUrlEncodedContentType,
      ),
    );

    return AuthenticationModel.fromJson(response.data);
  }

  Future<SearchResult> searchItems(
      AuthenticationModel authenticationModel, String searchTerms,
      [int offset = 0]) async {
    Response response = await dio.get(
      'https://api.spotify.com/v1/search?q=$searchTerms&type=album%2Cartist&market=ES&limit=10&offset=5',
      options: Options(
        headers: {'Authorization': "Bearer ${authenticationModel.accessToken}"},
        contentType: Headers.formUrlEncodedContentType,
      ),
    );

    if (response.statusCode == 200) {
      SearchResult searchResult = SearchResult.fromJson(response.data);
      return searchResult;
    }

    throw HttpException(response.toString());
  }
}
