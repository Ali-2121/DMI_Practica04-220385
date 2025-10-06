import 'package:flutter/material.dart';
import 'package:widgate_app_220385/domain/entities/video_post.dart';

class VideoScrollable extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollable({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [Container(color: Colors.red)],
    );
  }
}