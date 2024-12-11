import 'package:projects/domain/entities/song/song.dart';

abstract class PlayListState {}

class PlayListLoading extends PlayListState {}

class PlayListLoaded extends PlayListState {
  final List<SongEntity> playlist;
  PlayListLoaded({required this.playlist});
}

class PlayListLoadFailure extends PlayListState {}