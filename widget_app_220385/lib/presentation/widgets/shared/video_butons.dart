import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:widget_app_220385/config/helpers/human_formats.dart';
import 'package:widget_app_220385/domain/entitites/video_post.dart';

class VideoButtons extends StatelessWidget {
  final VideoPost video;

  const VideoButtons({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomIconButton(
          value: video.likes,
          iconData: Icons.favorite,
          iconColor: Colors.red,
        ),
        _CustomIconButton(
          value: video.views,
          iconData: Icons.remove_red_eye_outlined,
        ),
        _CustomIconButton(
          value: video.comments,
          iconData: Icons.comment_outlined,
        ),

        const SizedBox(height: 20),

        const _MuteButton(),

        const SizedBox(height: 20),

        SpinPerfect(
          infinite: true,
          duration: const Duration(seconds: 5),
          child: const _CustomIconButton(
            value: 0,
            iconData: Icons.play_circle_outline,
          ),
        ),
      ],
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  final int value;
  final IconData iconData;
  final Color color;

  const _CustomIconButton({
    required this.value,
    required this.iconData,
    iconColor,
  }) : color = iconColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(iconData, color: color),
        ),
        if (value > 0)
          Text(
            HumanFormats.humanReadbleNumber(value.toDouble()),
            style: const TextStyle(color: Colors.white), 
          ),
      ],
    );
  }
}

// 🎵 Nuevo widget para el ícono de audio ON/OFF
class _MuteButton extends StatefulWidget {
  const _MuteButton();

  @override
  State<_MuteButton> createState() => _MuteButtonState();
}

class _MuteButtonState extends State<_MuteButton> {
  bool isMuted = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 30,
      onPressed: () {
        setState(() {
          isMuted = !isMuted;
        });
      },
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation) =>
            ScaleTransition(scale: animation, child: child),
        child: Icon(
          isMuted ? Icons.volume_off_rounded : Icons.volume_up_rounded,
          key: ValueKey<bool>(isMuted),
          color: isMuted ? const Color.fromARGB(255, 109, 108, 108) : Colors.white,
        ),
      ),
    );
  }
}
