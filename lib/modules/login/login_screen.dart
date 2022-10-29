import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/layout/news_app/cubit/themeModeCubit.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        actions: [
          Icon(
            Icons.login,
            color: Colors.blue,
            size: 30.0,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              ThemeModeCubit.get(context).isDark
                  ? "assets/images/animation_news4.gif"
                  : "assets/images/animation_news3.gif",
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width / 1.5,
            ),
            Text(
              "News App",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 34.0,
                  fontStyle: FontStyle.italic,
                  fontFamily: "myfont"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(59, 89, 152, 1),
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Color.fromRGBO(59, 89, 152, 1), width: 1),
                    ),
                    child: SvgPicture.asset(
                      'assets/images/facebook.svg',
                      color: Colors.white,
                      // color: Color.fromRGBO(59, 89, 152, 1),
                      width: 25,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(211, 47, 47, 1),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Color.fromRGBO(211, 47, 47, 1),
                        width: 1,
                      ),
                    ),
                    child: SvgPicture.asset(
                      'assets/images/google-plus.svg',
                      color: Colors.white,
                      // color: Colors.red[700],
                      width: 25,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 172, 238, 1),
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Color.fromRGBO(0, 172, 238, 1), width: 1),
                    ),
                    child: SvgPicture.asset(
                      'assets/images/twitter.svg',
                      color: Colors.white,
                      // color: Color.fromRGBO(0, 172, 238, 1),
                      width: 25,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
