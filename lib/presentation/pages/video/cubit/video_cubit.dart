import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_task/core/resources/app_constants.dart';
import 'package:reddit_task/data/models/data%20models/video.dart';
import 'package:reddit_task/data/models/demo_data.dart';
import 'package:video_player/video_player.dart';

part 'video_state.dart';

class VideoCubit extends Cubit<VideoState> {
  VideoCubit(
    BuildContext context,
  ) : super(
          VideoState(
            theVideo: DemoData.theVideo,
            currentDuration: const Duration(),
          ),
        ) {
    init(context);
  }

  static VideoCubit get(BuildContext context) =>
      BlocProvider.of<VideoCubit>(context);

  late VideoPlayerController videoPlayerController;
  late final double maxVideoHeight;
  late final double minVideoHeight;
  late final double maxCommentsHeight;

  // ScrollController commentsScrollController = ScrollController();

  @override
  Future<void> close() {
    videoPlayerController.dispose();
    // commentsScrollController.dispose();
    return super.close();
  }

  void init(BuildContext context) async {
    // init video config
    videoPlayerController = VideoPlayerController.asset(
      state.theVideo.url,
    );
    await videoPlayerController.initialize();
    initVideoPlayer();

    // init commentsScrollController
    // commentsScrollController.addListener(onCommentsScroll);

    // init video height
    // ignore: use_build_context_synchronously
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    maxVideoHeight = mediaQueryData.size.height -
        mediaQueryData.padding.top -
        mediaQueryData.padding.bottom;
    maxCommentsHeight = maxVideoHeight * AppConstatnts.maxCommentsHeightRatio;
    minVideoHeight =
        maxVideoHeight * (1 - AppConstatnts.maxCommentsHeightRatio);

    // rebuild ui
    emit(state.copyWith(
      screenIsReady: true,
      videoHeight: maxVideoHeight,
    ));
  }

  void initVideoPlayer() {
    videoPlayerController.play();
    videoPlayerController.addListener(onVideoPlay);
    videoPlayerController.setLooping(true);
  }

  void onVideoPlay() async {
    emit(state.copyWith(currentDuration: await videoPlayerController.position));
  }

  double _startHoldPosation = 0.0;
  double _lastVideoHeight = 0.0;
  double _changeOffset = 0.0;
  void onVerticalDragUpdate(DragUpdateDetails v) {
    _changeOffset = v.localPosition.dy - _startHoldPosation;
    double videoHeight = _lastVideoHeight + _changeOffset;
    if (videoHeight > minVideoHeight && videoHeight <= maxVideoHeight) {
      emit(state.copyWith(videoHeight: _lastVideoHeight + _changeOffset));
    }
  }

  void onVerticalDragStart(DragStartDetails v) {
    _startHoldPosation = v.localPosition.dy;
    _lastVideoHeight = state.videoHeight;
  }

  void onVerticalDragEnd(DragEndDetails v, BuildContext context) {
    if (_changeOffset > 100) {
      hideComments();
    } else if (_changeOffset < -100) {
      showComments();
    } else {
      emit(state.copyWith(videoHeight: _lastVideoHeight));
    }
  }

  void onClickOnVedio() {
    if (state.isCommentsShowen) {
      hideComments();
    } else {
      onClickPlayOrPause();
    }
  }

  void showComments() {
    emit(
      state.copyWith(
        videoHeight: minVideoHeight,
        isCommentsShowen: true,
      ),
    );
  }

  void hideComments() {
    emit(
      state.copyWith(
        videoHeight: maxVideoHeight,
        isCommentsShowen: false,
      ),
    );
  }

  void onClickPlayOrPause() {
    emit(state.copyWith(isPlaying: !state.isPlaying));
    if (!state.isPlaying) {
      videoPlayerController.pause();
    } else {
      videoPlayerController.play();
    }
  }

  void onMute() {
    emit(state.copyWith(isMuted: !state.isMuted));
    if (!state.isMuted) {
      videoPlayerController.setVolume(1);
    } else {
      videoPlayerController.setVolume(0);
    }
  }

  void onChangeDuration(Duration duration) {
    videoPlayerController.seekTo(duration);
  }
}
