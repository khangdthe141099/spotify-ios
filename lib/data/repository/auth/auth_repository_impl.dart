import 'package:dartz/dartz.dart';
import 'package:projects/data/models/auth/create_user_req.dart';
import 'package:projects/data/models/auth/signin_user_req.dart';
import 'package:projects/data/sources/auth/auth_firebase_service.dart';
import 'package:projects/domain/repository/auth/auth.dart';
import 'package:projects/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signin(SigninUserReq signinUserReq) async {
    return await getIt<AuthFirebaseService>().signin(signinUserReq);
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    return await getIt<AuthFirebaseService>().signup(createUserReq);
  }
}
