import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YtbVideoPlayer extends StatefulWidget {
  String? videoID;

  YtbVideoPlayer(this.videoID);

  @override
  _YtbVideoPlayerState createState() => _YtbVideoPlayerState();
}

class _YtbVideoPlayerState extends State<YtbVideoPlayer> {
  YoutubePlayerController? _controller;
  double _volume = 100;

  Widget _ctrlVolume() {
    print(_volume);
    return ControleDeVolume(_volume, _controller);
  }

  @override
  void initState() {
    // TODO: implement initState
    // Chamada para carregar um dado ou configuração
    // uma única vez.
    // Inicia da criação da "Tela"
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId: widget.videoID!,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
        disableDragSeek: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: YoutubePlayer(
        controller: _controller!,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.red,
        progressColors: ProgressBarColors(
          playedColor: Colors.red,
          // handleColor: Colors.red,
          bufferedColor: Color.fromRGBO(255, 150, 150, 0.75),
        ),
        topActions: [
          IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.white,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          Expanded(
            child: Text(
              _controller!.metadata.title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              print("Setting Pressed");
            },
          ),
        ],
        bottomActions: [
          CurrentPosition(),
          RemainingDuration(),
          // PlayPauseButton(bufferIndicator:
          ProgressBar(
            colors: ProgressBarColors(
              playedColor: Colors.red,
              handleColor: Colors.red,
              bufferedColor: Color.fromRGBO(255, 150, 150, 0.75),
            ),
            isExpanded: true,
          ),
          IconButton(
            icon: Icon(Icons.volume_up),
            onPressed: () async {
              print("Sound Pressed");
              _volume = await showDialog<double>(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return _ctrlVolume();
                },
              ) as double;
            },
            color: Colors.white,
          ),
          PlaybackSpeedButton(
            icon: Icon(
              Icons.speed,
              color: Colors.white,
            ),
          ),
          FullScreenButton(),
        ],
        onEnded: (metaData) {
          // setState(() {
          //   _controller!.reset();
          //   _controller!.pause();
          // });
        },
      ),
    );
  }
}

class ControleDeVolume extends StatefulWidget {
  double? _volume;
  YoutubePlayerController? _controller;

  ControleDeVolume(this._volume, this._controller);

  @override
  _ControleDeVolumeState createState() => _ControleDeVolumeState();
}

class _ControleDeVolumeState extends State<ControleDeVolume> {
  Timer? _tempoDeVisualizacao;

  void _afterTimeBackTo() {
    Navigator.pop(context, widget._volume);
  }

  @override
  Widget build(BuildContext context) {
    _tempoDeVisualizacao = Timer(
      Duration(seconds: 3),
      _afterTimeBackTo,
    );

    return SimpleDialog(
      backgroundColor: Colors.transparent,
      children: [
        Container(
          color: Colors.transparent,
          height: 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.volume_mute_rounded),
                    color: Colors.white,
                    onPressed: () {
                      setState(() {
                        widget._volume = 0;
                        widget._controller!.setVolume(widget._volume!.round());
                      });
                    },
                  ),
                  Slider(
                    activeColor: Colors.blueGrey,
                    inactiveColor: Color.fromRGBO(0, 125, 255, 0.5),
                    value: widget._volume!,
                    max: 100,
                    min: 0,
                    divisions: 10,
                    onChanged: (value) {
                      setState(() {
                        widget._volume = value;
                        print(widget._volume!);
                        widget._controller!.setVolume(value.round());
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.volume_up_rounded),
                    color: Colors.white,
                    onPressed: () {
                      setState(() {
                        widget._volume = 100;
                        widget._controller!.setVolume(widget._volume!.round());
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
