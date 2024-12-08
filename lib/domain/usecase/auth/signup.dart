import 'package:dartz/dartz.dart';
import 'package:projects/core/usecase/usecase.dart';
import 'package:projects/data/models/auth/create_user_req.dart';
import 'package:projects/domain/repository/auth/auth.dart';
import 'package:projects/service_locator.dart';

class SignupUseCase implements UseCase<Either, CreateUserReq> {
  @override
  Future<Either> call({CreateUserReq? params}) async {
    return getIt<AuthRepository>().signup(params!);
  }
}