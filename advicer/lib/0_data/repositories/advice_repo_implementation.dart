import 'package:advicer/0_data/datasources/advice_remote_datasource.dart';
import 'package:advicer/0_data/exceptions/exceptions.dart';
import 'package:advicer/1_domain/failures/failures.dart';
import 'package:advicer/1_domain/entities/advice_entity.dart';
import 'package:advicer/1_domain/repositories/advice_repo.dart';
import 'package:dartz/dartz.dart';

class AdviceRepoImpl implements AdviceRepo {
  AdviceRepoImpl({required this.adviceRemoteDatasource});

  final AdviceRemoteDatasource adviceRemoteDatasource;

  @override
  Future<Either<AdviceEntity, Failure>> getAdviceFromDataSource() async {
    try {
      final result = await adviceRemoteDatasource.getRandomAdviceFromApi();
      return left(result);
    } on ServerException {
      return right(ServerFailure());
    } catch (e) {
      return right(GeneralFailure());
    }
  }
}
