import 'dart:convert';

import 'package:mamamamovies/models/movie_keyword.dart';
import 'package:mamamamovies/models/movie_model.dart';
import 'package:http/http.dart';

class MovieController {
  final String baseUrl = "https://api.themoviedb.org/3/";
  final String apiKey = '88ea9b20b0da1b164983d7bb20fa4894';
  // https://api.themoviedb.org/3/movie/550?api_key=88ea9b20b0da1b164983d7bb20fa4894
  //

  Future<List<Movie>> getTrendings() async {
    if (apiKey.isEmpty) {
      throw AssertionError('TMDB_KEY is not set');
    }

    final url = Uri(
      scheme: 'https',
      host: 'api.themoviedb.org',
      path: '3/trending/movie/week',
      queryParameters: {
        'api_key': apiKey, // read it here
        'include_adult': 'false',
      },
    );

    Response response = await get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      List<dynamic> results = body["results"];
      return results.map((item) => Movie.fromJson(item)).toList();
    } else {
      throw "Unable to retrieve posts";
    }
  }

  Future<List<Movie>> getUpcoming() async {
    if (apiKey.isEmpty) {
      throw AssertionError('TMDB_KEY is not set');
    }

    final url = Uri(
      scheme: 'https',
      host: 'api.themoviedb.org',
      path: '3/movie/upcoming',
      queryParameters: {
        'api_key': apiKey, // read it here
      },
    );

    Response response = await get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      List<dynamic> results = body["results"];
      return results.map((item) => Movie.fromJson(item)).toList();
    } else {
      throw "Unable to retrieve posts";
    }
  }

  Future<List<Movie>> getToprated() async {
    if (apiKey.isEmpty) {
      throw AssertionError('TMDB_KEY is not set');
    }

    final url = Uri(
      scheme: 'https',
      host: 'api.themoviedb.org',
      path: '3/movie/top_rated',
      queryParameters: {
        'api_key': apiKey, // read it here
      },
    );

    Response response = await get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      List<dynamic> results = body["results"];
      return results.map((item) => Movie.fromJson(item)).toList();
    } else {
      throw "Unable to retrieve posts";
    }
  }

  Future<List<Movie>> getMovieByQuery(query) async {
    if (apiKey.isEmpty) {
      throw AssertionError('TMDB_KEY is not set');
    }

    final url = Uri(
      scheme: 'https',
      host: 'api.themoviedb.org',
      path: '3/search/movie',
      queryParameters: {
        'api_key': apiKey, // read it here
        'include_adult': 'false',
        'query': query,
        'language': 'pt-BR'
      },
    );

    Response response = await get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      List<dynamic> results = body["results"];
      return results.map((item) => Movie.fromJson(item)).toList();
    } else {
      throw "Unable to retrieve posts";
    }
  }

  Future<List<Keyword>> getKeyWordsById(query) async {
    if (apiKey.isEmpty) {
      throw AssertionError('TMDB_KEY is not set');
    }
    //https://api.themoviedb.org/3/movie/347201/keywords?api_key=88ea9b20b0da1b164983d7bb20fa4894
    final url = Uri(
      scheme: 'https',
      host: 'api.themoviedb.org',
      path: '3/movie/$query/keywords',
      queryParameters: {
        'api_key': apiKey, // read it here
      },
    );

    Response response = await get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      List<dynamic> results = body["results"]["keywords"];
      return results.map((item) => Keyword.fromJson(item)).toList();
    } else {
      throw "Unable to retrieve posts";
    }
  }
}
