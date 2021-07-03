import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatefulWidget {
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/video.mp4")
      ..addListener(() => setState(() {}))
      ..initialize().then((_) => _controller.play());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: MediaQuery.of(context).orientation == Orientation.landscape
            ? Stack(children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  color: Colors.transparent,
                  child: Center(
                    child: _controller.value.isInitialized
                        ? AspectRatio(
                            aspectRatio: _controller.value.aspectRatio,
                            child: VideoPlayer(_controller),
                          )
                        : Container(),
                  ),
                ),
                Container(
                  height: 60,
                  color: Colors.transparent,
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back,
                            color: Colors.white, size: 30),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.80,
                  left: 0,
                  right: 0,
                  child: Row(
                    children: [
                      _controller.value.isPlaying
                          ? IconButton(
                              icon: Icon(
                                Icons.pause,
                                color: Colors.white,
                                size: 40,
                              ),
                              onPressed: () {
                                setState(() {
                                  _controller.pause();
                                });
                              },
                            )
                          : IconButton(
                              icon: Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                                size: 40,
                              ),
                              onPressed: () {
                                setState(() {
                                  _controller.play();
                                });
                              },
                            ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: VideoProgressIndicator(_controller,
                              allowScrubbing: true,
                              colors: VideoProgressColors(
                                  bufferedColor: Colors.white,
                                  backgroundColor: Colors.white,
                                  playedColor: Colors.grey)),
                        ),
                      )
                    ],
                  ),
                )
              ])
            : Stack(children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  color: Colors.transparent,
                  child: Center(
                    child: _controller.value.isInitialized
                        ? AspectRatio(
                            aspectRatio: _controller.value.aspectRatio,
                            child: VideoPlayer(_controller),
                          )
                        : Container(),
                  ),
                ),
                Container(
                  height: 60,
                  color: Colors.transparent,
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back,
                            color: Colors.white, size: 30),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.80,
                  left: 0,
                  right: 0,
                  child: Row(
                    children: [
                      _controller.value.isPlaying
                          ? IconButton(
                              icon: Icon(
                                Icons.pause,
                                color: Colors.white,
                                size: 40,
                              ),
                              onPressed: () {
                                setState(() {
                                  _controller.pause();
                                });
                              },
                            )
                          : IconButton(
                              icon: Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                                size: 40,
                              ),
                              onPressed: () {
                                setState(() {
                                  _controller.play();
                                });
                              },
                            ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: VideoProgressIndicator(_controller,
                              allowScrubbing: true,
                              colors: VideoProgressColors(
                                  bufferedColor: Colors.white,
                                  backgroundColor: Colors.white,
                                  playedColor: Colors.grey)),
                        ),
                      )
                    ],
                  ),
                )
              ]));
  }
}
