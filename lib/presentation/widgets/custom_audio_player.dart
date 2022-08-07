import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class CustomAudioPlayer extends StatefulWidget {
  final String url;
  const CustomAudioPlayer({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  State<CustomAudioPlayer> createState() => _CustomAudioPlayerState();
}

class _CustomAudioPlayerState extends State<CustomAudioPlayer> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  late StreamSubscription _onPlayerStateChanged;
  late StreamSubscription _onPlayerComplete;

  @override
  void initState() {
    super.initState();
    _onPlayerStateChanged = audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });
    _onPlayerComplete = audioPlayer.onPlayerComplete.listen((state) {
      setState(() {
        isPlaying = false;
      });
    });
  }

  @override
  void dispose() {
    _onPlayerStateChanged.cancel();
    _onPlayerComplete.cancel();
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 15,
      child: IconButton(
        icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
        iconSize: 15,
        onPressed: () async {
          if (isPlaying) {
            await audioPlayer.pause();
          } else {
            await audioPlayer.play(UrlSource(widget.url));
          }
        },
      ),
    );
  }
}
