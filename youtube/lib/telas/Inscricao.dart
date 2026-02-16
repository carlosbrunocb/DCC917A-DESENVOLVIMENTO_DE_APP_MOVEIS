import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Inscricao extends StatefulWidget {
  const Inscricao({Key? key}) : super(key: key);

  @override
  _InscricaoState createState() => _InscricaoState();
}

class _InscricaoState extends State<Inscricao> {
  YoutubePlayerController? _controller = YoutubePlayerController(
      initialVideoId: "eZkOCf2RZk8",
      // flags: YoutubePlayerFlags(
      //   autoPlay: true,
      //   mute: false,
      // )
  );

  @override
  Widget build(BuildContext context) {
    return
    //   YoutubePlayerBuilder(
    //     player: YoutubePlayer(
    //       controller: _controller!,
    //       showVideoProgressIndicator: true,
    //       onReady: () {
    //         _controller!.addListener(() { });
    //       },
    //       progressIndicatorColor: Colors.amber,
    //       progressColors: ProgressBarColors(
    //         playedColor: Colors.amber,
    //         handleColor: Colors.amberAccent,
    //       ),
    //     ),
    // builder: (context, player) {
    //       return Column(
    //         children: [
    //           player,
    //         ],
    //       );
    //     }
    // );




      Container(
        child: Center(
          child: Text(
            "Inscrição",
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        )
    );
  }
}
