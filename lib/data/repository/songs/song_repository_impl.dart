import 'package:dartz/dartz.dart';
import 'package:projects/data/sources/song/song.dart';
import 'package:projects/domain/repository/song/song.dart';
import 'package:projects/service_locator.dart';

class SongRepositoryImpl extends SongsRepository {
  @override
  Future<Either> getNewsSongs() async {
    return await getIt<SongFirebaseService>().getNewsSongs();
  }

  @override
  Future<Either> getPlayList() async {
    return await getIt<SongFirebaseService>().getPlayList();
  }
}
