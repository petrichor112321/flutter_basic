import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart'; //chewie插件导入
import 'package:video_player/video_player.dart';
import './tabs.dart';

void main() => runApp(const videoplayer());

class videoplayer extends StatefulWidget {
  const videoplayer({super.key});

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<videoplayer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0.0, //导航栏阴影
        centerTitle: true,
        title: Text('视频播放'),
      ),
      body: Scaffold(
          body: Column(
        children: [
          Container(
            height: 210,
            width: MediaQuery.of(context).size.width,
            child: Chewie(
              controller: ChewieController(
                videoPlayerController: VideoPlayerController.networkUrl(
                    Uri.parse('https://www.w3school.com.cn/i/movie.mp4')),
                //播放的视频地址写在这里
                aspectRatio: 5 / 3,
                //屏幕高宽比
                autoPlay: true,
                //是否自动播放
                looping: false, //是否循环播放
                //fullScreenByDefault:false, //默认情况下全屏
                //isLive:true, //视频长度替换成live字样
              ),
            ),
          ),
Expanded(child: tabs(),)
        ],
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
