import 'package:flutter/material.dart';

import 'mconstant.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  @override
  void initState() {
    super.initState();
    changeColor();
  }

  void changeColor() {
    setState(() {
      iconColor = iconColor == Colors.green ? Colors.amber : Colors.green;
      bigTextStyle = TextStyle(color: iconColor, fontSize: 30);
      midTextStyle = TextStyle(color: iconColor, fontSize: 25);
      smallTextStyle = TextStyle(color: iconColor, fontSize: 20);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Home Page",
            style: TextStyle(color: iconColor),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  changeColor();
                },
                icon: Icon(
                  Icons.color_lens_outlined,
                  color: iconColor,
                )),
          ],
        ),
        body: Stack(
          children: [
            //背景
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Container(
                color: iconColor == Colors.green
                    ? Colors.amberAccent[100]
                    : Colors.black45,
              ),
            ),
            //内容
            SingleChildScrollView(
              child: Column(
                children: [
                  //头像和介绍
                  Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: headWidget(context))
                  //
                ],
              ),
            ),
          ],
        ));
  }

  Widget headImgWidget =
      SizedBox(width: 500, child: Image.asset("lib/imgs/head_small.png"));

  Widget headWidget(BuildContext context) {
    if (MediaQuery.of(context).size.width > 800) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          headImgWidget,
          const SizedBox(
            width: 40,
          ),
          Expanded(child: ProfileWidget())
        ],
      );
    } else {
      return Column(
        children: [
          headImgWidget,
          const Divider(
            height: 20,
            color: Colors.transparent,
          ),
          ProfileWidget()
        ],
      );
    }
  }
}

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "DHASLKFHA",
          style: bigTextStyle.apply(fontStyle: FontStyle.italic),
        ),
        const Divider(
          height: 20,
          color: Colors.transparent,
        ),
        Text(
          "from Chongqing China",
          style: smallTextStyle.apply(
              color: iconColor == Colors.green ? Colors.black : Colors.white),
        ),
        const Divider(
          height: 20,
          color: Colors.transparent,
        ),
        Text(
          "He works for nearly 10 years as a software engineer, which is full of experience about Android development.",
          style: midTextStyle,
          maxLines: 10,
          overflow: TextOverflow.fade,
        )
      ],
    );
  }
}
