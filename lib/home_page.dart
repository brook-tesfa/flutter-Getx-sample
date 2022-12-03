import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_gql/video_info.dart';
import 'package:get/get.dart';
import 'colors.dart' as color;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MYState();
}

class _MYState extends State<MyHomePage> {
  List info = [];
  _initdata() {
    DefaultAssetBundle.of(context)
        .loadString("json/info.json")
        .then((value) => {
              setState(() {
                info = json.decode(value);
              })
            });
  }

  @override
  void initState() {
    super.initState();
    _initdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColor.homePageBackground,
      body: Container(
        padding: EdgeInsets.only(left: 30, top: 70, right: 30),
        child: Column(children: [
          Row(
            children: [
              Text(
                "Training",
                style: TextStyle(
                    fontSize: 30,
                    color: color.AppColor.homePageTitle,
                    fontWeight: FontWeight.w700),
              ),
              Expanded(child: Container()),
              Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: color.AppColor.homePageIcons,
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.calendar_today_outlined,
                size: 20,
                color: color.AppColor.homePageIcons,
              ),
              SizedBox(
                width: 15,
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: color.AppColor.homePageIcons,
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Text(
                "Training",
                style: TextStyle(
                    fontSize: 20,
                    color: color.AppColor.homePageSubtitle,
                    fontWeight: FontWeight.w700),
              ),
              Expanded(child: Container()),
              Text(
                "Details",
                style: TextStyle(
                  fontSize: 20,
                  color: color.AppColor.homePageDetail,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              InkWell(
                onTap: () {
                  Get.to(() => VideoInfo());
                },
                child: Icon(
                  Icons.arrow_forward,
                  size: 20,
                  color: color.AppColor.homePageIcons,
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 220,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  color.AppColor.gradientFirst.withOpacity(0.8),
                  color.AppColor.gradientSecond.withOpacity(0.9),
                ], begin: Alignment.bottomLeft, end: Alignment.centerRight),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    topRight: Radius.circular(80),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(10, 10),
                    blurRadius: 20,
                    color: color.AppColor.gradientSecond,
                  )
                ]),
            child: Container(
              padding: EdgeInsets.only(left: 20, top: 25, right: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Next Workout",
                      style: TextStyle(
                          fontSize: 16,
                          color: color.AppColor.homePageContainerTextSmall),
                    ),
                    SizedBox(
                      height: 5,
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
                      height: 25,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.timer,
                              size: 20,
                              color: color.AppColor.homePageContainerTextSmall,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "60 min ",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: color
                                      .AppColor.homePageContainerTextSmall),
                            ),
                          ],
                        ),
                        Expanded(child: Container()),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(4, 8),
                                  blurRadius: 10,
                                  color: color.AppColor.gradientFirst,
                                )
                              ]),
                          child: Icon(
                            Icons.play_circle_fill,
                            size: 60,
                            color: color.AppColor.homePageContainerTextSmall,
                          ),
                        )
                      ],
                    )
                  ]),
            ),
          ),
          SizedBox(
            height: 35,
          ),
          Container(
            height: 180,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Container(
                  height: 120,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage("assets/card.png"),
                        fit: BoxFit.fill,
                      ),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 40,
                            offset: Offset(8, 10),
                            color: color.AppColor.gradientSecond)
                      ]),
                ),
                Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(right: 200, bottom: 50),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage("assets/figure.png"),
                      // fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  width: double.maxFinite,
                  height: 100,
                  // color: Colors.redAccent.withOpacity(0.3),
                  margin: EdgeInsets.only(left: 150, top: 25),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "You are doing great",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: color.AppColor.homePageDetail),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Keep it up",
                          style: TextStyle(
                              fontSize: 16,
                              // fontWeight: FontWeight.bold,
                              color: color.AppColor.homePagePlanColor),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Stick to your plan",
                          style: TextStyle(
                              fontSize: 16,
                              // fontWeight: FontWeight.bold,
                              color: color.AppColor.homePagePlanColor),
                        ),
                      ]),
                )
              ],
            ),
          ),
          Row(
            children: [
              Text(
                "Area of focus",
                style: TextStyle(
                    fontSize: 25,
                    color: color.AppColor.homePageTitle,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
          Expanded(
              child: OverflowBox(
            maxWidth: MediaQuery.of(context).size.width,
            child: MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: ListView.builder(
                  itemCount: (info.length.toDouble() / 2).toInt(),
                  itemBuilder: (_, i) {
                    int a = 2 * i;
                    int b = 2 * i + 1;

                    return Row(
                      children: [
                        Container(
                          height: 170,
                          width: (MediaQuery.of(context).size.width - 90) / 2,
                          margin:
                              EdgeInsets.only(left: 30, bottom: 15, top: 15),
                          padding: EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: AssetImage(info[a]['img'])),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 3,
                                  offset: Offset(5, 5),
                                  color: color.AppColor.gradientSecond
                                      .withOpacity(0.1)),
                              BoxShadow(
                                  blurRadius: 3,
                                  offset: Offset(-5, -5),
                                  color: color.AppColor.gradientSecond
                                      .withOpacity(0.1))
                            ],
                          ),
                          child: Center(
                              child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              info[a]['title'],
                              style: TextStyle(
                                  fontSize: 20,
                                  color: color.AppColor.homePageDetail),
                            ),
                          )),
                        ),
                        Container(
                          height: 170,
                          width: (MediaQuery.of(context).size.width - 90) / 2,
                          padding: EdgeInsets.only(bottom: 5),
                          margin:
                              EdgeInsets.only(left: 30, bottom: 15, top: 15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: AssetImage(info[b]['img'])),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 3,
                                  offset: Offset(5, 5),
                                  color: color.AppColor.gradientSecond
                                      .withOpacity(0.1)),
                              BoxShadow(
                                  blurRadius: 3,
                                  offset: Offset(-5, -5),
                                  color: color.AppColor.gradientSecond
                                      .withOpacity(0.1))
                            ],
                          ),
                          child: Center(
                              child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              info[b]['title'],
                              style: TextStyle(
                                  fontSize: 20,
                                  color: color.AppColor.homePageDetail),
                            ),
                          )),
                        )
                      ],
                    );
                  }),
            ),
          ))
        ]),
      ),
    );
  }
}
