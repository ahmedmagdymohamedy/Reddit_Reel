// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'video_cubit.dart';

class VideoState {
  // main data
  Video theVideo;
  double videoHeight;
  bool isCommentsShowen;
  bool screenIsReady;

  // vedio settings
  bool isPlaying;
  bool isMuted;
  Duration currentDuration;
  VideoState({
    required this.theVideo,
    this.videoHeight = 0,
    this.isCommentsShowen = false,
    this.screenIsReady = false,
    this.isPlaying = true,
    this.isMuted = false,
    required this.currentDuration,
  });

  VideoState copyWith({
    Video? theVideo,
    double? videoHeight,
    bool? isCommentsShowen,
    bool? screenIsReady,
    bool? isPlaying,
    bool? isMuted,
    Duration? currentDuration,
  }) {
    return VideoState(
      theVideo: theVideo ?? this.theVideo,
      videoHeight: videoHeight ?? this.videoHeight,
      isCommentsShowen: isCommentsShowen ?? this.isCommentsShowen,
      screenIsReady: screenIsReady ?? this.screenIsReady,
      isPlaying: isPlaying ?? this.isPlaying,
      isMuted: isMuted ?? this.isMuted,
      currentDuration: currentDuration ?? this.currentDuration,
    );
  }
}
