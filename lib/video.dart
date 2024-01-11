import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

/// Stateful widget to fetch and then display video content.
class VideoApp extends StatefulWidget {
  const VideoApp({super.key});

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
        Uri.parse(
            // 'https://ycfitness.xyz/mail/channel/1/attachment/637',
            // 'https://odoo.ycfitness.xyz/mail/channel/1/attachment/637',
          // 'https://odoo.ycfitness.xyz/web/content/?model=member.post.media&id=274&field=video',
          'https://odoo.ycfitness.xyz/web/content/member.post.media/274/video'
        ),
        httpHeaders: {
          "Cookie":
          "session_id=9f935807fd1784341b170f1154cb5bbb8a0893dc"
        })
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        )
            : Container(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );

  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
