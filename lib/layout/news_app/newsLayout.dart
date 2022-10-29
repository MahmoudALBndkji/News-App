import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/cubit/cubit.dart';
import 'package:news_app/layout/news_app/cubit/states.dart';
import 'package:news_app/layout/news_app/cubit/themeModeCubit.dart';
import 'package:news_app/modules/login/login_screen.dart';
import 'package:news_app/modules/onBoardingPage/onBoardingPage.dart';
import 'package:news_app/modules/rate/rate_screen.dart';
import 'package:news_app/modules/search/search_screen.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewsLayout extends StatefulWidget {
  @override
  State<NewsLayout> createState() => _NewsLayoutState();
}

class _NewsLayoutState extends State<NewsLayout> {
  double opacity = 1.0;

  @override
  void initState() {
    super.initState();
    changeOpacity();
  }

  changeOpacity() {
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        opacity = opacity == 0.0 ? 1.0 : 0.0;
        changeOpacity();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                cubit.titles[cubit.currentIndex],
              ),
              actions: [
                Icon(
                  cubit.icons[cubit.currentIndex],
                  color: cubit.colors[cubit.currentIndex],
                  size: 30.0,
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            body: cubit.screens[cubit.currentIndex],
            drawer: Drawer(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10.0),
                      splashColor: Colors.blue[400],
                      onTap: () => navigateTo(context, LoginScreen()),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            child: CircleAvatar(
                              backgroundColor:
                                  ThemeModeCubit.get(context).isDark
                                      ? Colors.white24
                                      : Colors.grey,
                              radius: 30.0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50.0),
                                child: Image.asset(
                                  "assets/images/avatar1.png",
                                  width: 40,
                                  height: 40,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            padding: EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 3.0, color: Colors.blue[400]!),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            "Click here for login",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20.0,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Ink(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.0),
                        color: Colors.deepOrange[200],
                      ),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        trailing: Icon(
                          Icons.tips_and_updates_outlined,
                          size: 30.0,
                          color: Colors.deepOrange,
                        ),
                        onTap: () async {
                          final prefs = await SharedPreferences.getInstance();
                          prefs.setBool('showHome', false);
                          // Navigator.of(context).pushReplacement(
                          //   MaterialPageRoute(
                          //     builder: (context) => OnBoardingPage(),
                          //   ),
                          navigateReplacmentTo(context, OnBoardingPage());
                        },
                        title: Text(
                          'Intro',
                          style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 25.0),
                          child: Container(
                            width: 40,
                            height: 4.5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(200.0),
                              color: Colors.deepOrange,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 155,
                        ),
                        Container(
                          width: 20,
                          height: 4.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(200.0),
                            color: Colors.deepOrange,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Ink(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.0),
                        color: Colors.blue[300],
                      ),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        trailing: Icon(
                          Icons.search,
                          size: 30.0,
                          color: Colors.blue,
                        ),
                        onTap: () => navigateTo(context, SearchScreen()),
                        title: Text(
                          'Search',
                          style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 25.0),
                          child: Container(
                            width: 60,
                            height: 4.5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(200.0),
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 143,
                        ),
                        Container(
                          width: 20,
                          height: 4.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(200.0),
                            color: Colors.blue,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Ink(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.0),
                        color: Colors.yellow[200],
                      ),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        trailing: Icon(
                          Icons.star_rate_rounded,
                          size: 30.0,
                          color: Colors.yellow[600],
                        ),
                        onTap: () => navigateTo(context, RateScreen()),
                        title: Text(
                          'Rate',
                          style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 25.0),
                          child: Container(
                            width: 40,
                            height: 4.5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(200.0),
                              color: Colors.yellow[400],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 163,
                        ),
                        Container(
                          width: 20,
                          height: 4.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(200.0),
                            color: Colors.yellow[400],
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Ink(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.0),
                        color: Colors.black26,
                      ),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        trailing: Icon(
                          Icons.brightness_4_outlined,
                          size: 30.0,
                        ),
                        onTap: () =>
                            ThemeModeCubit.get(context).changeAppMode(),
                        title: Text(
                          'Theme',
                          style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 25.0),
                          child: Container(
                            width: 65,
                            height: 4.5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(200.0),
                              color: ThemeModeCubit.get(context).isDark
                                  ? Colors.black
                                  : Colors.grey,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 140,
                        ),
                        Container(
                          width: 20,
                          height: 4.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(200.0),
                            color: ThemeModeCubit.get(context).isDark
                                ? Colors.black
                                : Colors.grey,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Text(
                    "Thanks For Using \nOur App",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ThemeModeCubit.get(context).isDark
                          ? Colors.grey[500]
                          : Colors.black,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 110.0),
                    width: 100,
                    color: Colors.grey[600],
                    height: 3,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 70.0),
                    width: 100,
                    color: Colors.grey[600],
                    height: 3,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  AnimatedOpacity(
                    opacity: opacity,
                    duration: Duration(seconds: 2),
                    child: Icon(
                      Icons.favorite,
                      color: Colors.pink,
                      size: 90.0,
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: CurvedNavigationBar(
              animationDuration: Duration(milliseconds: 300),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              color: ThemeModeCubit.get(context).isDark
                  ? Colors.white12
                  : Colors.black26,
              index: cubit.currentIndex,
              onTap: (index) => cubit.changeBottomNavBar(index),
              items: cubit.curvedBottomItems(context),
            ),
          );
        });
  }
}
