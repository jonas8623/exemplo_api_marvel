import 'package:api_marvel/model/model.dart';

abstract class MovieRepository {

  Future<Movie> getMovies();

}