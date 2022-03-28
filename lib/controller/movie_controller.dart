import 'dart:convert';
import 'dart:developer';
import 'package:api_marvel/constant.dart';
import 'package:api_marvel/model/movie.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MovieController {

  ValueNotifier<List<Movie>> numberOfFilms = ValueNotifier<List<Movie>>([]);
  List<Movie> listMovie = [];

  Future<void> fetchMovies() async {

    final client = http.Client();
    final response = await client.get(Uri.parse(Constant.baseUrl));

    try {
      if (response.statusCode == 200) {
        final responseBody = response.body;
        final responseDecoded = jsonDecode(responseBody);
        final List marvelData = responseDecoded['data'];
        for(var i = 0; i < marvelData.length; i++) {
          final movie = Movie.fromJson(marvelData[i] as Map<String, dynamic>);
          // print(responseDecoded['data']);
          // print('NUMEROS DE MOVIES ${numberOfFilms.value.length}');
          listMovie.add(movie);
          numberOfFilms.value = listMovie;
        }
        // setState({});
        numberOfFilms.value;
      } else {
        log(response.statusCode.toString());
      }
    } catch(e) {
      log(e.toString());
    }
  }

  List<Movie> parsedJson(final responseBody) {
    final jsonDecoded = json.decode(responseBody["data"]);
    List<dynamic> movies = jsonDecoded;

    return movies.map((e) => Movie.fromJson(e)).toList();
  }

}