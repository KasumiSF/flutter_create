import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';
import 'zcw_chewie_player.dart';

class zf_video_playbackx extends StatefulWidget {
 // zf_video_playbackx({Key key}):super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _zf_video_playback_view();
  }

}
class _zf_video_playback_view extends State<zf_video_playbackx>{
  VideoPlayerController _videoPlayerController1 ;


  @override
  void initState() {
    // TODO: implement initState
    _videoPlayerController1 = VideoPlayerController.network(
        'https://gss3.baidu.com/6LZ0ej3k1Qd3ote6lo7D0j9wehsv/tieba-smallvideo-transcode/280_292c94d1c12ca09e73b9a72210dfa3b9_3.mp4');
    super.initState();
  }
//  @override
//  void deactivate() {
//    _videoPlayerController1.dispose();
//    _videoPlayerController2.dispose();
//    _chewieController.dispose();
//    super.dispose();
//  }

  @override
  void dispose() {
    // TODO: implement dispose
    print('页面被销毁');
    _videoPlayerController1.dispose();
   // _chewieController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
//    _chewieController  = ChewieController(
//      videoPlayerController: _videoPlayerController1,
//      aspectRatio: 3 / 2,
//      autoPlay: true,
//      looping: false,
//    );


    return new Container(
      color: Color(0xff000000),
      height: (MediaQuery.of(context).size.width /3)*1.6,
      child:  new Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: new zcw_Chewie(
                _videoPlayerController1,
                aspectRatio: 3 / 2,
                autoPlay: true,
                looping: true,
              )
            ),
            flex: 1,
          ),
        ],
      ),

    );
  }
}
