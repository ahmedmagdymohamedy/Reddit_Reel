import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_task/core/extensions/duration_ext.dart';
import 'package:reddit_task/core/resources/app_colors.dart';
import 'package:reddit_task/core/resources/app_constants.dart';
import 'package:reddit_task/presentation/pages/video/cubit/video_cubit.dart';
import 'package:reddit_task/presentation/pages/video/view/widgets/comments.dart';
import 'package:reddit_task/presentation/pages/video/view/widgets/time_line.dart';
import 'package:reddit_task/presentation/widgets/app_loading_indicator.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VideoCubit(context),
      child: BlocBuilder<VideoCubit, VideoState>(
        builder: (context, state) {
          VideoCubit videoCubit = VideoCubit.get(context);
          return GestureDetector(
            onVerticalDragUpdate: videoCubit.onVerticalDragUpdate,
            onVerticalDragStart: videoCubit.onVerticalDragStart,
            onVerticalDragEnd: (v) => videoCubit.onVerticalDragEnd(v, context),
            child: Scaffold(
              backgroundColor: Colors.black,
              body: SafeArea(
                child: !state.screenIsReady
                    ? const AppLoadingIndicator()
                    : Column(
                        children: [
                          GestureDetector(
                            onTap: videoCubit.onClickOnVedio,
                            child: AnimatedContainer(
                              duration: const Duration(
                                  milliseconds: AppConstatnts
                                      .openCommentsAnimationSpeedInMillisconds),
                              curve: Curves.easeOutQuad,
                              height: state.videoHeight,
                              width: double.infinity,
                              child: Stack(
                                children: [
                                  Center(
                                    child: AspectRatio(
                                      aspectRatio: videoCubit
                                          .videoPlayerController
                                          .value
                                          .aspectRatio,
                                      child: VideoPlayer(
                                        videoCubit.videoPlayerController,
                                      ),
                                    ),
                                  ),
                                  AnimatedOpacity(
                                    opacity: state.isCommentsShowen ? 0 : 1,
                                    duration: const Duration(
                                      milliseconds: AppConstatnts
                                          .openCommentsAnimationSpeedInMillisconds,
                                    ),
                                    child: Align(
                                      alignment: Alignment.topCenter,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.close,
                                              size: 34,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                radius: 16,
                                                backgroundImage: NetworkImage(
                                                    state.theVideo.imageUrl),
                                                backgroundColor: AppColors.body,
                                              ),
                                              const SizedBox(width: 10),
                                              Text(
                                                state.theVideo.publisherName,
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.more_horiz_outlined,
                                              size: 34,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      width: double.infinity,
                                      height: state.videoHeight / 2,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                          colors: [
                                            Colors.black.withOpacity(0.6),
                                            Colors.transparent,
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: AnimatedOpacity(
                                        opacity: state.isCommentsShowen ? 0 : 1,
                                        duration: const Duration(
                                          milliseconds: AppConstatnts
                                              .openCommentsAnimationSpeedInMillisconds,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Row(
                                              children: [
                                                CircleAvatar(
                                                  radius: 16,
                                                  backgroundImage: NetworkImage(
                                                      state.theVideo.imageUrl),
                                                  backgroundColor:
                                                      AppColors.body,
                                                ),
                                                const SizedBox(width: 10),
                                                Expanded(
                                                  child: Text(
                                                    state
                                                        .theVideo.publisherName,
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 16),
                                            Text(
                                              state.theVideo.title,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(height: 16),
                                            Row(
                                              children: [
                                                IconButton(
                                                  onPressed: videoCubit
                                                      .onClickPlayOrPause,
                                                  icon: Icon(
                                                    state.isPlaying
                                                        ? Icons.pause
                                                        : Icons.play_arrow,
                                                    size: 40,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                const SizedBox(width: 16),
                                                Timeline(
                                                  currentDuration:
                                                      state.currentDuration,
                                                  vedioDuration: videoCubit
                                                      .videoPlayerController
                                                      .value
                                                      .duration,
                                                  onChangeDuration: videoCubit
                                                      .onChangeDuration,
                                                ),
                                                const SizedBox(width: 16),
                                                Text(
                                                  state.currentDuration.print(),
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                const SizedBox(width: 16),
                                                IconButton(
                                                  onPressed: videoCubit.onMute,
                                                  icon: Icon(
                                                    state.isMuted
                                                        ? Icons.volume_off_sharp
                                                        : Icons.volume_up,
                                                    size: 34,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 16),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (state.isCommentsShowen)
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Padding(
                                        padding: const EdgeInsets.all(16),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            IconButton(
                                              onPressed:
                                                  videoCubit.onClickPlayOrPause,
                                              icon: Icon(
                                                state.isPlaying
                                                    ? Icons.pause
                                                    : Icons.play_arrow,
                                                size: 30,
                                                color: Colors.white,
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: videoCubit.onMute,
                                              icon: Icon(
                                                state.isMuted
                                                    ? Icons.volume_off_sharp
                                                    : Icons.volume_up,
                                                size: 30,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                ],
                              ),
                            ),
                          ),
                          const Expanded(
                            child: CommentsWidget(),
                          ),
                        ],
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}
