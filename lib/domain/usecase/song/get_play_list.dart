import 'package:dartz/dartz.dart';
import 'package:projects/core/usecase/usecase.dart';
import 'package:projects/domain/repository/song/song.dart';
import 'package:projects/service_locator.dart';

class GetPlayListUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await getIt<SongsRepository>().getPlayList();
  }
}
