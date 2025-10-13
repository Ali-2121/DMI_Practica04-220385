import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FullscreenPlayer extends StatefulWidget {
  final String videoUrl;
  final String caption;

  const FullscreenPlayer({
    super.key,
    required this.videoUrl,
    required this.caption,
  });

  @override
  State<FullscreenPlayer> createState() => _FullscreenPlayerState();
}

class _FullscreenPlayerState extends State<FullscreenPlayer> {
  late VideoPlayerController controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();

    controller = VideoPlayerController.asset(widget.videoUrl)
      ..setVolume(0)
      ..setLooping(true);

    // ✅ Solo inicializamos una vez
      _initializeVideoPlayerFuture = controller.initialize().then((_) {
    controller.play(); // 👈 se llama después de inicializar
    setState(() {});   // 👈 fuerza el rebuild
  });
}

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
Widget build(BuildContext context) {
 return FutureBuilder(
  future: _initializeVideoPlayerFuture,
  builder: (context, snapshot) {
    if (snapshot.hasError) {
      return Center(child: Text('Error: ${snapshot.error}'));
    }

    if (snapshot.connectionState != ConnectionState.done) {
      return const Center(child: CircularProgressIndicator(strokeWidth: 2));
    }

    if (!controller.value.isInitialized) {
      return const Center(child: Text('Video no inicializado'));
    }

    return AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: VideoPlayer(controller),
    );
  },
);
}
}