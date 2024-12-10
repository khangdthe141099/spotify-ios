import 'package:get_it/get_it.dart';
import 'package:projects/data/repository/auth/auth_repository_impl.dart';
import 'package:projects/data/repository/songs/song_repository_impl.dart';
import 'package:projects/data/sources/auth/auth_firebase_service.dart';
import 'package:projects/data/sources/song/song.dart';
import 'package:projects/domain/repository/auth/auth.dart';
import 'package:projects/domain/repository/song/song.dart';
import 'package:projects/domain/usecase/song/song.dart';

import 'domain/usecase/auth/signin.dart';
import 'domain/usecase/auth/signup.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  //AUTH:
  getIt.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  getIt.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  getIt.registerSingleton<SignupUseCase>(SignupUseCase()); //SIGNUP
  getIt.registerSingleton<SigninUseCase>(SigninUseCase()); //SIGNIN

  //SONGS:
  getIt.registerSingleton<SongFirebaseService>(SongFirebaseServiceImpl());
  getIt.registerSingleton<SongsRepository>(SongRepositoryImpl());
  getIt.registerSingleton<SongUseCase>(SongUseCase());
}
