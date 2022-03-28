import 'package:api_marvel/constant.dart';
import 'package:api_marvel/model/movie.dart';
import 'package:api_marvel/repositories/repositories.dart';
import 'package:api_marvel/service/service.dart';

class MovieRepositoryImplement implements MovieRepository {

  final DioService _dioService;
  MovieRepositoryImplement(this._dioService);

  @override
  Future<Movie> getMovies() async {
    final result = await _dioService.getDio().get(Constant.path);
    return Movie.fromJson(result.data);
  }

}