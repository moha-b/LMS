import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/features/lessons_details_view/cubit/video_controls_cubit.dart';
import 'package:lms/features/lessons_details_view/views/widgets/custom_controls.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatelessWidget {
  const VideoPlayerWidget({super.key, required this.videoUrl});
  final String videoUrl;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VideoControlsCubit()..initializeController(videoUrl),
      child: BlocBuilder<VideoControlsCubit, VideoPlayerController?>(
        builder: (context, videoPlayerController) {
          if (videoPlayerController != null) {
            final chewieController = ChewieController(
              videoPlayerController: videoPlayerController,
              autoInitialize: true,
              aspectRatio: 16 / 9,
              allowFullScreen: true,
              customControls: CustomControls(
                isFullScreen: context.read<VideoControlsCubit>().isFullScreen,
                videoPlayerController: videoPlayerController,
                isPlayingNotifier:
                    context.read<VideoControlsCubit>().isPlayingNotifier,
                onRewind: () {
                  context.read<VideoControlsCubit>().onRewind();
                },
                onSkip: () {
                  context.read<VideoControlsCubit>().onSkip();
                },
                onPlay: () {
                  context.read<VideoControlsCubit>().play();
                },
                onPause: () {
                  context.read<VideoControlsCubit>().pause();
                },
                onToggleFullScreen: () {
                  context.read<VideoControlsCubit>().onToggleFullScreen();
                },
              ),
            );

            return Chewie(controller: chewieController);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
