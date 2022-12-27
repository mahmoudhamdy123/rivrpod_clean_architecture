import 'package:dio/dio.dart';
import 'package:riverpod_clean_architecture/core/global/error/exceptions.dart';
import 'package:riverpod_clean_architecture/core/network/api_constanse.dart';
import 'package:riverpod_clean_architecture/core/network/error_message_model.dart';
import 'package:riverpod_clean_architecture/feature/home/data/models/movies_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MoviesModel>> getNowPlayingMovies();
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MoviesModel>> getNowPlayingMovies() async {
    final Response response = await Dio().get(ApiConstance.nowPlayingMoviesPath);
    if (response.statusCode == 200) {
      return List<MoviesModel>.from(
          (response.data["results"] as List).map((e) => MoviesModel.fromJson(e)));
    } else {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
