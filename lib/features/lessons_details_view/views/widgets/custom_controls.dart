import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/navigation/navigation.dart';
import 'package:lms/core/utils/app_colors.dart';
import 'package:lms/core/utils/app_icons.dart';
import 'package:video_player/video_player.dart';

class CustomControls extends StatefulWidget {
  final VoidCallback onRewind;
  final VoidCallback onSkip;
  final VoidCallback onPlay;
  final VoidCallback onPause;
  final ValueNotifier<bool> isPlayingNotifier;
  final VideoPlayerController videoPlayerController;
  final VoidCallback onToggleFullScreen;
  bool isFullScreen;

  CustomControls({
    super.key,
    required this.onRewind,
    required this.onSkip,
    required this.onPlay,
    required this.onPause,
    required this.isPlayingNotifier,
    required this.videoPlayerController,
    required this.onToggleFullScreen,
    required this.isFullScreen,
  });

  @override
  State<CustomControls> createState() => _CustomControlsState();
}

class _CustomControlsState extends State<CustomControls> {
  late String positionText;
  late String durationText;
  double _sliderValue = 0.0;
  bool _showControls = true;
  late Timer _hideControlsTimer;

  @override
  void initState() {
    super.initState();
    positionText = _formatDuration(widget.videoPlayerController.value.position);
    durationText = _formatDuration(widget.videoPlayerController.value.duration);

    widget.videoPlayerController.addListener(_videoPlayerListener);
    _hideControlsTimer = _startHideControlsTimer();
  }

  Timer _startHideControlsTimer() {
    return Timer.periodic(const Duration(seconds: 3), (timer) {
      if (widget.isPlayingNotifier.value) {
        setState(() {
          _showControls = false;
        });
        timer.cancel();
      }
    });
  }

  void _resetHideControlsTimer() {
    _hideControlsTimer.cancel();
    _hideControlsTimer = _startHideControlsTimer();
  }

  @override
  void dispose() {
    widget.videoPlayerController.removeListener(_videoPlayerListener);
    _hideControlsTimer.cancel();

    super.dispose();
  }

  void _videoPlayerListener() {
    setState(() {
      positionText =
          _formatDuration(widget.videoPlayerController.value.position);
      _sliderValue =
          widget.videoPlayerController.value.position.inSeconds.toDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    durationText = _formatDuration(widget.videoPlayerController.value.duration);

    return GestureDetector(
      onTap: () {
        setState(() {
          _showControls = !_showControls;
        });
        _resetHideControlsTimer();
      },
      child: _showControls
          ? _buildControls()
          : Container(
              color: Colors.transparent,
            ),
    );
  }

  Widget _buildControls() {
    return Padding(
      padding: EdgeInsets.only(top: 24.h),
      child: Column(
        children: [
          SizedBox(
            width: 327.w,
            height: widget.isFullScreen ? 50.h : 40.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    NavigationHelper.goBack();
                  },
                  child: Container(
                    width: widget.isFullScreen ? 70.h : 28.w,
                    height: widget.isFullScreen ? 50.h : 30.h,
                    decoration: BoxDecoration(
                      color: AppColors.violet50,
                      borderRadius: BorderRadius.circular(13.r),
                    ),
                    child: Icon(
                      AppIcons.arrow_left,
                      size: 19.sp,
                      color: AppColors.primary,
                    ),
                  ),
                ),
                PopupMenuButton<double>(
                  icon: Icon(
                    AppIcons.more_circle,
                    size: 27.sp,
                    color: AppColors.white,
                  ),
                  itemBuilder: (context) {
                    return <PopupMenuEntry<double>>[
                      const PopupMenuItem(
                        value: 0.25,
                        child: Text('0.25x'),
                      ),
                      const PopupMenuItem(
                        value: 0.5,
                        child: Text('0.5x'),
                      ),
                      const PopupMenuItem(
                        value: 0.75,
                        child: Text('0.75x'),
                      ),
                      const PopupMenuItem(
                        value: 1.0,
                        child: Text('Normal'),
                      ),
                      const PopupMenuItem(
                        value: 1.25,
                        child: Text('0.25x'),
                      ),
                      const PopupMenuItem(
                        value: 1.5,
                        child: Text('1.5x'),
                      ),
                      const PopupMenuItem(
                        value: 1.75,
                        child: Text('0.25x'),
                      ),
                      const PopupMenuItem(
                        value: 2.0,
                        child: Text('2.0x'),
                      ),
                    ];
                  },
                  onSelected: (speed) {
                    setState(() {
                      widget.videoPlayerController.setPlaybackSpeed(speed);
                    });
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: widget.isFullScreen ? 100.h : 24.h),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    AppIcons.backward_10_seconds,
                    size: 25.5.sp,
                    color: AppColors.white,
                  ),
                  onPressed: widget.onRewind,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 26.w),
                  child: ValueListenableBuilder<bool>(
                    valueListenable: widget.isPlayingNotifier,
                    builder: (context, isPlaying, _) {
                      return IconButton(
                        icon: Icon(
                          isPlaying ? AppIcons.pause : AppIcons.play,
                          size: 39.sp,
                          color: AppColors.white,
                        ),
                        onPressed: isPlaying
                            ? widget.onPause
                            : () {
                                widget.onPlay();
                              },
                      );
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(AppIcons.forward_10_seconds,
                      size: 25.5.sp, color: AppColors.white),
                  onPressed: widget.onSkip,
                ),
              ],
            ),
          ),
          SizedBox(height: widget.isFullScreen ? 75.h : 25.h),
          SizedBox(
            height: 24.h,
            width: 370.w,
            child: Slider(
              thumbColor: AppColors.secondary,
              activeColor: AppColors.secondary,
              value: _sliderValue,
              min: 0,
              max: widget.videoPlayerController.value.duration.inSeconds
                  .toDouble(),
              onChanged: (value) {
                setState(() {
                  _sliderValue = value;
                });
                widget.videoPlayerController
                    .seekTo(Duration(seconds: value.toInt()));
              },
            ),
          ),
          SizedBox(
            height: widget.isFullScreen ? 30.h : 20.h,
            width: 327.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  positionText,
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 11.sp,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      durationText,
                      style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 11.sp,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.isFullScreen = !widget.isFullScreen;
                          widget.onToggleFullScreen();
                        });
                      },
                      child: Icon(
                        Icons.fullscreen,
                        color: Colors.white,
                        size: 20.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatDuration(Duration duration) {
    return "${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}";
  }
}
