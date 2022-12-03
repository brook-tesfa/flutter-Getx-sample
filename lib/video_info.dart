import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_gql/home_page.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'colors.dart' as color;

class VideoInfo extends StatefulWidget {
  const VideoInfo({Key? key}) : super(key: key);

  @override
  State<VideoInfo> createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  List vidinfo = [];
  bool _playspace = false;
  bool _isplaying = false;
  bool _dispose = false;
  int _isPlayingInde = -1;
  VideoPlayerController? _controller;
  _initdata() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/videoinfo.json")
        .then((value) => {
              setState(() {
                vidinfo = json.decode(value);
              })
            });
  }

  @override
  void initState() {
    super.initState();
    _initdata();
  }

  @override
  void dispose() {
    _dispose = true;
    _controller?.pause();
    _controller?.dispose();
    _controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: _playspace == false
            ? BoxDecoration(
                gradient: LinearGradient(colors: [
                color.AppColor.gradientFirst,
                color.AppColor.gradientSecond
              ], begin: FractionalOffset(0.0, 0.4), end: Alignment.topRight))
            : BoxDecoration(color: color.AppColor.gradientSecond),
        child: Column(children: [
          _playspace == false
              ? Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(top: 70, left: 30, right: 30),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: color.AppColor.secondPageIconColor,
                                size: 20,
                              ),
                            ),
                            Expanded(child: Container()),
                            Icon(
                              Icons.info_outline,
                              color: color.AppColor.secondPageIconColor,
                              size: 20,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Legs Toning",
                          style: TextStyle(
                              fontSize: 25,
                              color: color.AppColor.homePageContainerTextSmall),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "and Glutes Workout",
                          style: TextStyle(
                              fontSize: 25,
                              color: color.AppColor.homePageContainerTextSmall),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 30,
                              width: 90,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                      colors: [
                                        color.AppColor
                                            .secondPageContainerGradient1stColor,
                                        color.AppColor
                                            .secondPageContainerGradient2ndColor
                                      ],
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight)),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.timer,
                                      color: color.AppColor.secondPageIconColor,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "68 min",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: color
                                              .AppColor.secondPageTitleColor),
                                    )
                                  ]),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              height: 30,
                              width: 250,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                      colors: [
                                        color.AppColor
                                            .secondPageContainerGradient1stColor,
                                        color.AppColor
                                            .secondPageContainerGradient2ndColor
                                      ],
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight)),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.handyman_outlined,
                                      color: color.AppColor.secondPageIconColor,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Resistent band, kettebell",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: color
                                              .AppColor.secondPageTitleColor),
                                    )
                                  ]),
                            )
                          ],
                        )
                      ]),
                )
              : Container(
                  child: Column(children: [
                    Container(
                      height: 100,
                      padding: EdgeInsets.only(top: 50, left: 30, right: 30),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: 20,
                              color: color.AppColor.secondPageIconColor,
                            ),
                          ),
                          Expanded(child: Container()),
                          Icon(
                            Icons.info_outline,
                            size: 20,
                            color: color.AppColor.secondPageTopIconColor,
                          )
                        ],
                      ),
                    ),
                    _playvideo(context),
                    _controlView(context),
                  ]),
                ),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topRight: Radius.circular(70)),
            ),
            child: Column(children: [
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    "Circuit 1 : Legs Toning",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: color.AppColor.circuitsColor),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.loop,
                        size: 30,
                        color: color.AppColor.loopColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "3 sets",
                        style: TextStyle(
                            fontSize: 15,
                            //fontWeight: FontWeight.bold,
                            color: color.AppColor.setsColor),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(child: _listBuild())
            ]),
          ))
        ]),
      ),
    );
  }

  _cardBuild(int index) {
    return Container(
      height: 135,
      //color: Colors.redAccent,
      width: 200,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage(vidinfo[index]["thumbnail"]),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    vidinfo[index]["title"],
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    vidinfo[index]["time"],
                    style: TextStyle(color: Colors.grey[500]),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 18,
          ),
          Row(
            children: [
              Container(
                height: 20,
                width: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFeaeefc)),
                child: Center(
                  child: Text(
                    "15s rest",
                    style: TextStyle(color: Color(0xFF839fed)),
                  ),
                ),
              ),
              Row(
                children: [
                  for (int i = 0; i < 70; i++)
                    i.isEven
                        ? Container(
                            height: 1,
                            width: 3,
                            decoration: BoxDecoration(
                                color: Color(0xFF839fed),
                                borderRadius: BorderRadius.circular(2)),
                          )
                        : Container(
                            height: 1,
                            width: 3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: Colors.white),
                          )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  _listBuild() {
    return ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
        itemCount: vidinfo.length,
        itemBuilder: (_, int index) {
          return GestureDetector(
              onTap: () {
                _onTapVideo(index);
                debugPrint(index.toString());
                setState(() {
                  if (_playspace == false) {
                    _playspace = true;
                  }
                });
              },
              child: _cardBuild(index));
        });
  }

  var _onUpdateControllertime;
  void _oncontrollerUpdate() async {
    if (_dispose) {
      return;
    }
    _onUpdateControllertime = 0;
    final now = DateTime.now().millisecondsSinceEpoch;
    if (_onUpdateControllertime > now) {
      return;
    }
    _onUpdateControllertime = now + 500;
    final controller = _controller;
    if (controller == null) {
      debugPrint("controller is null");
      return;
    }
    if (!controller.value.isInitialized) {
      debugPrint("can not be intialized");

      return;
    }
    final playing = controller.value.isBuffering;
    _isplaying = playing;
  }

  intializevideo(int index) {
    final controller =
        VideoPlayerController.network(vidinfo[index]["videoUrl"]);
    final old = _controller;
    _controller = controller;
    if (old != null) {
      old.removeListener(() {
        _oncontrollerUpdate();
        old.pause();
      });
    }
    _controller = controller;
    setState(() {});
    controller
      ..initialize().then((_) {
        old?.dispose();
        _isPlayingInde = index;
        controller.addListener(_oncontrollerUpdate);
        controller.play();
        setState(() {});
      });
  }

  _onTapVideo(index) {
    intializevideo(index);
  }

  Widget _playvideo(BuildContext context) {
    final controller = _controller;
    if (controller != null && controller.value.isInitialized) {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: VideoPlayer(controller),
      );
    } else {
      return AspectRatio(
          aspectRatio: 16 / 9,
          child: Text(
            "being intialized soon pls wait",
            style: TextStyle(fontSize: 20, color: Colors.white60),
          ));
    }
  }

  Widget _controlView(BuildContext context) {
    final noMute = (_controller?.value?.volume ?? 0) > 0;

    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(bottom: 5),
      color: color.AppColor.gradientSecond,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Container(
                decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                  BoxShadow(
                    offset: Offset(0.0, 0.0),
                    blurRadius: 4.0,
                    color: Color.fromARGB(50, 0, 0, 0),
                  )
                ]),
                child: Icon(
                  noMute ? Icons.volume_up : Icons.volume_off,
                  color: Colors.white,
                ),
              ),
            ),
            onTap: () {
              if (noMute) {
                _controller?.setVolume(0);
              } else {
                _controller?.setVolume(1.0);
              }
              setState(() {});
            },
          ),
        //   FlatButton(
        //       onPressed: () async {
        //         final index = _isPlayingInde - 1;
        //         if (index >= 0 && vidinfo.length >= 0) {
        //           intializevideo(index);
        //         } else {
        //           Get.snackbar("Video", "NO more video to play",
        //               snackPosition: SnackPosition.BOTTOM,
        //               icon: Icon(
        //                 Icons.face,
        //                 size: 30,
        //                 color: Colors.white,
        //               ),
        //               backgroundColor: color.AppColor.gradientSecond,
        //               colorText: Colors.white,
        //               messageText: Text(
        //                 "No More Video in the list",
        //                 style: TextStyle(fontSize: 20, color: Colors.white),
        //               ));
        //         }
        //       },
        //       child: Icon(
        //         Icons.fast_rewind,
        //         size: 30,
        //         color: Colors.white,
        //       )),
        //   FlatButton(
        //       onPressed: () async {
        //         if (_isplaying) {
        //           setState(() {
        //             _isplaying = false;
        //           });
        //           _controller?.pause();
        //         } else {
        //           setState(() {
        //             _isplaying = true;
        //           });
        //           _controller?.play();
        //         }
        //       },
        //       child: Icon(
        //         _isplaying ? Icons.pause : Icons.play_arrow,
        //         size: 30,
        //         color: Colors.white,
        //       )),
        //   FlatButton(
        //       onPressed: () async {
        //         final index = _isPlayingInde + 1;
        //         if (index <= vidinfo.length - 1) {
        //           intializevideo(index);
        //         } else {
        //           Get.snackbar("Video", "NO more video to play",
        //               snackPosition: SnackPosition.BOTTOM,
        //               icon: Icon(
        //                 Icons.face,
        //                 size: 30,
        //                 color: Colors.white,
        //               ),
        //               backgroundColor: color.AppColor.gradientSecond,
        //               colorText: Colors.white,
        //               messageText: Text(
        //                 "No More Video in the list",
        //                 style: TextStyle(fontSize: 20, color: Colors.white),
        //               ));
        //         }
        //       },
        //       child: Icon(
        //         Icons.fast_forward,
        //         size: 30,
        //         color: Colors.white,
        //       ))
        // ],
      ]),
    );
  }
}
