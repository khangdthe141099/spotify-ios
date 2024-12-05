import 'package:dartz/dartz.dart';
import 'package:projects/core/usecase/usecase.dart';
import 'package:projects/data/models/auth/signin_user_req.dart';
import 'package:projects/domain/repository/auth/auth.dart';
import 'package:projects/service_locator.dart';

class SigninUseCase implements UseCase<Either, SigninUserReq> {
  @override
  Future<Either> call({SigninUserReq? params}) async {
    return getIt<AuthRepository>().signin(params!);
  }
}
