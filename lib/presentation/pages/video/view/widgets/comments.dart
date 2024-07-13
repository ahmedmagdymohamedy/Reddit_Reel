// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_task/core/resources/app_colors.dart';
import 'package:reddit_task/presentation/pages/video/cubit/video_cubit.dart';
import 'package:reddit_task/presentation/pages/video/view/widgets/comment_card.dart';

class CommentsWidget extends StatelessWidget {
  const CommentsWidget({
    Key? key,
  }) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoCubit, VideoState>(
      builder: (context, state) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              clipBehavior: Clip.hardEdge,
              height: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: AppColors.ligtBlack,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height:
                        constraints.maxHeight > 40 ? 40 : constraints.maxHeight,
                    child: SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: SizedBox(
                        height: 40,
                        child: Center(
                          child: Container(
                            height: 4,
                            width: 64,
                            decoration: BoxDecoration(
                              color: AppColors.darkGrey,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      child: SingleChildScrollView(
                          child: Column(
                        children: [
                          ...state.theVideo.comments.map(
                            (e) => Column(
                              children: [
                                CommentCard(
                                  comment: e,
                                ),
                                Container(
                                  height: 12,
                                  width: double.infinity,
                                  color: Colors.black,
                                )
                              ],
                            ),
                          )
                        ],
                      )),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
