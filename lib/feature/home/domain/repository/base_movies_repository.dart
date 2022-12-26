import 'package:dartz/dartz.dart';
import 'package:riverpod_clean_architecture/core/global/error/failure.dart';
import 'package:riverpod_clean_architecture/feature/home/domain/entities/movie.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
}
