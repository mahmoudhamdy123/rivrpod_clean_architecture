import 'package:dartz/dartz.dart';
import 'package:riverpod_clean_architecture/core/global/error/failure.dart';
import 'package:riverpod_clean_architecture/core/usecases/base_use_case.dart';
import 'package:riverpod_clean_architecture/feature/home/domain/entities/movie.dart';
import 'package:riverpod_clean_architecture/feature/home/domain/repository/base_movies_repository.dart';

class GetNewPlayingMoviesUseCases extends BaseUseCase<List<Movie>, NoParameters> {
  final BaseMoviesRepository baseMoviesRepository;
  GetNewPlayingMoviesUseCases(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async {
    return await baseMoviesRepository.getNowPlayingMovies();
  }
}
