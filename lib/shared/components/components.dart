import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/layout/news_app/cubit/themeModeCubit.dart';
import 'package:news_app/modules/web_view/web_view_screen.dart';

Widget buildArticleItem(article, context) => InkWell(
      splashColor: Colors.blue[700],
      borderRadius: BorderRadius.circular(20),
      onTap: () => navigateTo(
        context,
        WebViewScreen(
          url: article['url'],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image: DecorationImage(
                  image: NetworkImage('${article['urlToImage']}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Container(
                height: 120.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${article['title']}',
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '${article['publishedAt']}',
                      style: TextStyle(
                        color: Colors.grey[600],
                        // fontSize: 18.0,
                        // fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

Widget myDivider() => Padding(
      padding: EdgeInsets.symmetric(horizontal: 100),
      child: Container(
        height: 4.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(200.0),
          color: Colors.blue,
        ),
        // child: Divider(
        //   height: 2,
        //   thickness: 4.5,
        // ),
      ),
    );

Widget articleBuilder(list, BuildContext context, {isSearch = false}) =>
    ConditionalBuilder(
      condition: list.length > 0,
      builder: (context) => Stack(
        children: [
          // Padding(
          //   padding: EdgeInsets.only(
          //       top: 10.0, left: 10.0, right: 10.0, bottom: 150.0),
          //   child: Container(
          //     decoration: BoxDecoration(
          //       color: ThemeModeCubit.get(context).isDark
          //           ? Colors.blue[300]
          //           : Colors.grey[300],
          //       borderRadius: BorderRadius.only(
          //         topLeft: Radius.circular(45.0),
          //         bottomRight: Radius.circular(90.0),
          //         topRight: Radius.circular(2.0),
          //         bottomLeft: Radius.circular(2.0),
          //
          //       ),
          //     ),
          //   ),
          // ),
          Center(
            child: Container(
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: ThemeModeCubit.get(context).isDark
                    ? Colors.white.withOpacity(0.1)
                    : Colors.black.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: ThemeModeCubit.get(context).isDark
                      ? Colors.grey[800]
                      : Colors.grey[300],
                  // borderRadius: BorderRadius.circular(40),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: ThemeModeCubit.get(context).isDark
                        ? Colors.white
                        : Colors.black,
                    width: 2,
                  ),
                ),
                child: Image.asset(
                  'assets/images/news2.png',
                  color: Colors.brown,
                  width: MediaQuery.of(context).size.width / 2,
                ),
              ),
            ),
          ),
          ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) =>
                buildArticleItem(list[index], context),
            separatorBuilder: (context, index) => myDivider(),
            itemCount: list.length,
          ),
        ],
      ),
      fallback: (context) => isSearch
          ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.blue, width: 1),
                    ),
                    child: Icon(
                      Icons.search,
                      size: 60.0,
                      color: Colors.blue,
                    )),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Search For What You Want',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.blue,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

void navigateReplacmentTo(context, widget) => Navigator.pushReplacement(
    context, MaterialPageRoute(builder: (context) => widget));

Widget buildPage({
  required Color colorContainer,
  required String urlImage,
  required String title,
  required Color colorTitle,
  required String subTitle,
  required Color colorSubTitle,
  required BuildContext context,
}) =>
    Stack(
      children: [
        Container(
          color: colorContainer,
          constraints: BoxConstraints.expand(),
          child: SvgPicture.asset(
            urlImage,
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
        ),
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // SizedBox(
              //   height: MediaQuery.of(context).size.height / 10,
              // ),
              // SvgPicture.asset(
              //   urlImage,
              //   fit: BoxFit.cover,
              //   width: MediaQuery.of(context).size.height / 2.7,
              // ),

              // Image.asset(
              //   urlImage,
              //   fit: BoxFit.cover,
              //   width: MediaQuery.of(context).size.height / 2.7,
              // ),

              Padding(
                padding:
                    EdgeInsets.only(top: MediaQuery.of(context).size.width / 5),
                child: Text(
                  title,
                  style: TextStyle(
                    color: colorTitle,
                    fontFamily: 'myfont',
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height - MediaQuery.of(context).size.width + 50,
              // ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.width / 8,
                    left: 15.0,
                    right: 15.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: colorContainer.withOpacity(0.7),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      topLeft: Radius.circular(40.0),
                      bottomRight: Radius.circular(40.0),
                      bottomLeft: Radius.circular(20.0),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Expanded(
                    child: Text(
                      subTitle,
                      style: TextStyle(
                        height: 1.5,
                        color: colorSubTitle,
                        fontSize: 22.0,
                        fontStyle: FontStyle.italic,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
