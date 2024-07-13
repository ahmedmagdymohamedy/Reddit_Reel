// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'package:reddit_task/presentation/pages/video/cubit/video_cubit.dart';

// ignore: must_be_immutable
class Timeline extends StatefulWidget {
  Duration currentDuration;
  Duration vedioDuration;
  Function(Duration duration) onChangeDuration;
  Timeline({
    Key? key,
    required this.currentDuration,
    required this.vedioDuration,
    required this.onChangeDuration,
  }) : super(key: key);

  @override
  State<Timeline> createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  late VideoPlayerController videoPlayerController;
  double barWidth = 0;
  bool _isPlayedWhenDrag = true;

  @override
  void initState() {
    videoPlayerController = VideoCubit.get(context).videoPlayerController;
    super.initState();
  }

  void onHorizontalDragStart(DragStartDetails v) {
    _isPlayedWhenDrag = videoPlayerController.value.isPlaying;
    videoPlayerController.pause();
  }

  void onHorizontalDragUpdate(DragUpdateDetails v) {
    jumbToSecond(v.localPosition.dx);
  }

  void onHorizontalDragEnd(DragEndDetails v) {
    if (_isPlayedWhenDrag) {
      videoPlayerController.play();
    }
  }

  void onClickTimeLine(TapDownDetails v) {
    jumbToSecond(v.localPosition.dx);
  }

  void jumbToSecond(double touchLocation) {
    int targetedSecond =
        (touchLocation * widget.vedioDuration.inSeconds / barWidth).floor();
    widget.onChangeDuration(
      Duration(seconds: targetedSecond),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTapDown: onClickTimeLine,
        onHorizontalDragStart: onHorizontalDragStart,
        onHorizontalDragUpdate: onHorizontalDragUpdate,
        onHorizontalDragEnd: onHorizontalDragEnd,
        child: Container(
          height: 20,
          width: double.infinity,
          color: Colors.transparent,
          child: LayoutBuilder(
            builder: (context, constraints) {
              barWidth = constraints.maxWidth;
              return Stack(
                clipBehavior: Clip.none,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 4,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        width: double.infinity,
                        color: Colors.white.withOpacity(0.4),
                      ),
                      PositionedDirectional(
                        start: (widget.currentDuration.inSeconds /
                                widget.vedioDuration.inSeconds *
                                constraints.maxWidth) -
                            constraints.maxWidth,
                        child: Container(
                            height: 4,
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            width: constraints.maxWidth,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      PositionedDirectional(
                        start: (widget.currentDuration.inSeconds /
                                widget.vedioDuration.inSeconds *
                                constraints.maxWidth) -
                            10,
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
