import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/domain/entities/song/song.dart';
import 'package:projects/presentation/home/bloc/play_list_cubit.dart';
import '../bloc/play_list_state.dart';

class PlayList extends StatelessWidget {
  const PlayList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => PlayListCubit()..getPlayList(),
        child: BlocBuilder<PlayListCubit,PlayListState>(
          builder:(context,state) {
            if(state is PlayListLoading) {
              return Container(
                alignment: Alignment.center,
                child: const CircularProgressIndicator(),
              );
            }
            if(state is PlayListLoaded) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 20
                ),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Playlist',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                          ),
                        ),

                        Text(
                          'See More',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Color(0xffC6C6C6)
                          ),
                        ),

                      ],
                    ),
                    const SizedBox(height: 20,),
                    _songs(state.playlist)
                  ],
                ),
              );
            }

            return Container();
          } ,
        )
    );
  }

  Widget _songs(List<SongEntity> songs) {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context,index) {
          return GestureDetector(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xffE6E6E6)
                      ),
                      child: Icon(
                        Icons.play_arrow_rounded,
                        color: const Color(0xff555555)
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          songs[index].title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                          ),
                        ),
                        const SizedBox(height: 5,),
                        Text(
                          songs[index].artist,
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 11
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                        songs[index].duration.toString().replaceAll('.', ':')
                    ),
                    const SizedBox(width: 20,),
                    // FavoriteButton(
                    //   songEntity: songs[index],
                    // )
                  ],
                )
              ],
            ),
          );
        },
        separatorBuilder: (context,index) => const SizedBox(height: 20,),
        itemCount: songs.length
    );
  }
}