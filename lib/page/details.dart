import 'package:course_app/constart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFF5F4EF),
          image: DecorationImage(
              image: AssetImage("images/ux_big.png"),
              alignment: Alignment.topRight),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20, top: 50, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      InkWell(
                        child: SvgPicture.asset("icons/arrow-left.svg"),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      Spacer(),
                      SvgPicture.asset("icons/more-vertical.svg")
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ClipPath(
                    clipper: BestSellerClipper(),
                    child: Container(
                      color: kBestSellerColor,
                      // margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.only(
                          left: 10, top: 5, right: 20, bottom: 5),
                      child: Text(
                        "BestSeller".toUpperCase(),
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Design Thinking",
                    style: kHeadingextStyle,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset("icons/person.svg"),
                      SizedBox(
                        width: 5,
                      ),
                      Text("18K"),
                      SizedBox(
                        width: 20,
                      ),
                      SvgPicture.asset("icons/star.svg"),
                      SizedBox(
                        width: 5,
                      ),
                      Text("4.8")
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: "\$50 ",
                      style: kHeadingextStyle.copyWith(fontSize: 32),
                    ),
                    TextSpan(
                        text: "\$70",
                        style: TextStyle(
                            color: kTextColor.withOpacity(.5),
                            decoration: TextDecoration.lineThrough))
                  ]))
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Expanded(
                child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Course Content",
                          style: kTitleTextStyle,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        CourseContent(
                          number: "01",
                          duration: "5.35",
                          title: "WelCome to the Course",
                          isDone: true,
                        ),
                        CourseContent(
                          number: "02",
                          duration: "19:04",
                          title: "Design Thinking - Intro",
                          isDone: true,
                        ),
                        CourseContent(
                          number: "03",
                          duration: "12:48",
                          title: "Design Thinking Process",
                        ),
                        CourseContent(
                          number: "04",
                          duration: "37:54",
                          title: "Customer Perspective",
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  left: 0,
                  bottom: 0,
                  child: Container(
                    padding: EdgeInsets.only(
                        left: 20, top: 10, bottom: 10, right: 20),
                    height: 80,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40),
                            topLeft: Radius.circular(40)),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 4),
                              color: kTextColor.withOpacity(.2),
                              blurRadius: 50)
                        ]),
                    child: Row(
                      children: [
                        Container(
                          height: 56,
                          width: 80,
                          padding: EdgeInsets.all(14),
                          decoration: BoxDecoration(
                              color: Color(0xFFFFEDEE),
                              borderRadius: BorderRadius.circular(40)),
                          child: SvgPicture.asset("icons/shopping-bag.svg"),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                            child: FlatButton(
                          padding: EdgeInsets.all(0),
                          onPressed: () {
                            // SnackBar(content: Text("谢谢"));
                            final snackBar =
                                new SnackBar(content: new Text('这是一个SnackBar'));
                            Scaffold.of(context).showSnackBar(snackBar);
                          },
                          child: Container(
                            height: 56,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: kBlueColor),
                            child: Text(
                              "Buy Now",
                              style: kSubtitleTextStyle.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ))
                      ],
                    ),
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}

class CourseContent extends StatelessWidget {
  const CourseContent({
    Key key,
    this.number,
    this.duration,
    this.title,
    this.isDone = false,
  }) : super(key: key);

  final String number;
  final String duration;
  final String title;
  final bool isDone;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        children: [
          Text(
            number,
            style: kHeadingextStyle.copyWith(
                color: kTextColor.withOpacity(0.15), fontSize: 32),
          ),
          SizedBox(
            width: 20,
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(
              text: "$duration mins\n",
              style: TextStyle(color: kTextColor.withOpacity(.5), fontSize: 18),
            ),
            TextSpan(
                text: title,
                style: kSubtitleTextStyle.copyWith(
                    fontWeight: FontWeight.w600, height: 1.5))
          ])),
          Spacer(),
          Container(
            height: 40,
            width: 40,
            // padding: EdgeInsets.only(left: 20),
            // margin: EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kGreenColor.withOpacity(isDone ? 1 : .5),
            ),
            child: Icon(
              Icons.play_arrow,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class BestSellerClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(size.width - 20, 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width - 20, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<dynamic> oldClipper) {
    return false;
  }
}
