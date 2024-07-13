// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:reddit_task/core/resources/app_colors.dart';
import 'package:reddit_task/core/resources/app_constants.dart';
import 'package:reddit_task/core/resources/app_strings.dart';
import 'package:reddit_task/data/models/data%20models/app_comment.dart';

// ignore: must_be_immutable
class CommentCard extends StatefulWidget {
  AppComment comment;
  bool isReplay;
  CommentCard({
    Key? key,
    required this.comment,
    this.isReplay = false,
  }) : super(key: key);

  @override
  State<CommentCard> createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  double likeButtonOffset = 0;
  double disLikeButtonOffset = 0;

  static const double interactiveOffsetStrong = 12;

  void onTapShowReplies() {
    setState(() {
      widget.comment.isRepliesShowen = true;
    });
  }

  void onLike() async {
    if (widget.comment.interactive == 1) {
      setState(() {
        widget.comment.interactive = 0;
        widget.comment.liksNumber--;
      });
      return;
    }
    if (widget.comment.interactive == -1) {
      onDisLike();
    }

    setState(() {
      widget.comment.interactive = 1;
      widget.comment.liksNumber++;
      likeButtonOffset = -interactiveOffsetStrong;
    });
    await Future.delayed(
      const Duration(
          milliseconds: AppConstatnts.interactiveAnimationSpeedInMillisconds),
    );
    setState(() {
      likeButtonOffset = 0;
    });
  }

  void onDisLike() async {
    if (widget.comment.interactive == -1) {
      setState(() {
        widget.comment.interactive = 0;
        widget.comment.liksNumber++;
      });
      return;
    }

    if (widget.comment.interactive == 1) {
      onLike();
    }

    setState(() {
      widget.comment.interactive = -1;
      widget.comment.liksNumber--;
      disLikeButtonOffset = interactiveOffsetStrong;
    });
    await Future.delayed(
      const Duration(
          milliseconds: AppConstatnts.interactiveAnimationSpeedInMillisconds),
    );
    setState(() {
      disLikeButtonOffset = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(12, 12, widget.isReplay ? 0 : 12, 0),
      decoration: BoxDecoration(
        border: BorderDirectional(
          start: BorderSide(
            color: widget.isReplay
                ? AppColors.darkGrey.withOpacity(0.7)
                : Colors.transparent,
          ),
        ),
      ),
      child: LayoutBuilder(builder: (context, constraints) {
        Size size = constraints.biggest;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage(widget.comment.image),
                  backgroundColor: AppColors.body,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    "${widget.comment.publisherName} • 153d",
                    style: const TextStyle(
                      // fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              widget.comment.content,
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.head,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.more_horiz,
                  ),
                ),
                const SizedBox(width: 6),
                InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.reply_sharp,
                      ),
                      if (size.width > 400)
                        Text(
                          AppStrings.Replay,
                          style: const TextStyle(fontSize: 12),
                        ),
                    ],
                  ),
                ),
                const SizedBox(width: 6),
                InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.air_sharp,
                  ),
                ),
                const SizedBox(width: 6),
                InkWell(
                  onTap: onLike,
                  child: SizedBox(
                    height: 24,
                    width: 24,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        AnimatedPositioned(
                          duration: const Duration(
                            milliseconds: AppConstatnts
                                .interactiveAnimationSpeedInMillisconds,
                          ),
                          top: likeButtonOffset,
                          child: Icon(
                            Icons.keyboard_double_arrow_up_sharp,
                            color: widget.comment.interactive == 1
                                ? AppColors.red
                                : null,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                if (widget.comment.liksNumber != 0)
                  Text(
                    widget.comment.liksNumber.toString(),
                    style: TextStyle(
                      color: widget.comment.interactive == 1
                          ? AppColors.red
                          : widget.comment.interactive == -1
                              ? AppColors.blue
                              : null,
                    ),
                  ),
                const SizedBox(width: 6),
                InkWell(
                  onTap: onDisLike,
                  child: SizedBox(
                    height: 24,
                    width: 24,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        AnimatedPositioned(
                          duration: const Duration(
                            milliseconds: AppConstatnts
                                .interactiveAnimationSpeedInMillisconds,
                          ),
                          top: disLikeButtonOffset,
                          child: Icon(
                            Icons.keyboard_double_arrow_down_sharp,
                            color: widget.comment.interactive == -1
                                ? AppColors.blue
                                : null,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (widget.comment.replies.isNotEmpty) ...[
              const SizedBox(height: 8),
              if (widget.comment.isRepliesShowen)
                ...widget.comment.replies.map(
                  (e) => CommentCard(
                    comment: e,
                    isReplay: true,
                  ),
                ),
              if (!widget.comment.isRepliesShowen) ...[
                InkWell(
                  onTap: onTapShowReplies,
                  child: Container(
                    width: double.infinity,
                    color: Colors.black,
                    padding: const EdgeInsets.all(6),
                    child: Center(
                      child: Text(
                        AppStrings.more_replay,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
              ]
            ],
          ],
        );
      }),
    );
  }
}
