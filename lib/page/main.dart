import 'package:course_app/constart.dart';
import 'package:course_app/model/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

import 'details.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Course App",
      debugShowCheckedModeBanner: false,
      // home: HomeScreen(),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20, top: 50, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset("icons/menu.svg"),
                Image.asset("images/user.png"),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Hey Alex,",
              style: kHeadingextStyle,
            ),
            Text(
              "Find a course you want to learn",
              style: kSubheadingextStyle,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F7),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Row(
                children: [
                  SvgPicture.asset("icons/search.svg"),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "Search for anything",
                    style: TextStyle(fontSize: 18, color: Color(0xFFA0A5BD)),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  "Categories",
                  style: kTitleTextStyle,
                ),
                Spacer(),
                Text(
                  "See All",
                  style: kSubtitleTextStyle.copyWith(color: kBlueColor),
                )
              ],
            ),
            Expanded(
                child: StaggeredGridView.countBuilder(
              physics: BouncingScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    NavigatorUtils.push(context, DetailsScreen());
                  },
                  child: Container(
                    padding: EdgeInsets.all(20),
                    height: index.isEven ? 200 : 240,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                            image: AssetImage(categorys[index].image),
                            fit: BoxFit.fill)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          categorys[index].name,
                          style: kTitleTextStyle,
                        ),
                        Text(
                          categorys[index].numOfCourse.toString() + " Courses",
                          style: TextStyle(color: kTextColor.withOpacity(0.5)),
                        ),
                      ],
                    ),
                  ),
                );
              },
              staggeredTileBuilder: (index) => StaggeredTile.fit(1),
              itemCount: categorys.length,
            ))
          ],
        ),
      ),
    );
  }
}
