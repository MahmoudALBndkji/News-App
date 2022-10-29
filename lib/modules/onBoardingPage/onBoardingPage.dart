import 'package:flutter/material.dart';
import 'package:news_app/layout/news_app/newsLayout.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final controller = PageController();
  bool isLastPage = false;
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 80.0),
        child: PageView(
          onPageChanged: (index) {
            setState(
              () {
                currentPage = index;
                isLastPage = index == 2;
              },
            );
          },
          controller: controller,
          children: [
            buildPage(
              context: context,
              colorContainer: Colors.teal.shade400,
              colorTitle: Colors.teal.shade100,
              colorSubTitle: Colors.black,
              urlImage: "assets/images/business/5.svg",
              title: "Politics and Economy",
              subTitle:
                  "You can now browse and view latest what is happening in the world of the latest news related to economy and politics",
            ),
            buildPage(
              context: context,
              colorContainer: Colors.indigo[400]!,
              colorTitle: Colors.indigo[200]!,
              colorSubTitle: Colors.white,
              urlImage: "assets/images/sports/3.svg",
              title: "Sports",
              subTitle:
                  "The latest news in various sports fields in the world, from the most famous to the strangest, is now at your fingertips",
            ),
            buildPage(
              context: context,
              colorContainer: Colors.blue[300]!,
              colorTitle: Colors.blue[200]!,
              colorSubTitle: Colors.black,
              urlImage: "assets/images/science/4.svg",
              title: "Sciences",
              subTitle:
                  "Everything you need to know about the latest developments in world science you can now follow",
            ),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue[400]!,
                minimumSize: Size.fromHeight(80),
              ),
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                prefs.setBool('showHome', true);
                // Navigator.of(context).pushReplacement(
                //   MaterialPageRoute(builder: (context) => NewsLayout()),
                // );
                navigateReplacmentTo(context, NewsLayout());
              },
              child: Text(
                "Get Started",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic,
                ),
              ),
            )
          : Container(
              decoration: BoxDecoration(
                color: currentPage == 0
                    ? Colors.teal.shade300.withOpacity(0.9)
                    : (currentPage == 1)
                        ? Colors.indigo[400]!.withOpacity(0.9)
                        : null,
              ),
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              height: 80.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      textStyle: TextStyle(
                        fontSize: 18.0,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    onPressed: () => controller.jumpToPage(2),
                    child: Text("Skip"),
                  ),
                  Center(
                    child: SmoothPageIndicator(
                      effect: WormEffect(
                        spacing: 16,
                        dotColor: Colors.black26,
                        activeDotColor: currentPage == 0
                            ? Colors.teal.shade300.withOpacity(0.9)
                            : (currentPage == 1)
                                ? Colors.indigo[400]!.withOpacity(0.9)
                                : Colors.white,
                      ),
                      onDotClicked: (index) => controller.animateToPage(index,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeIn),
                      controller: controller,
                      count: 3,
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: currentPage == 0
                          ? Colors.teal.shade300.withOpacity(0.9)
                          : (currentPage == 1)
                              ? Colors.indigo[400]!.withOpacity(0.9)
                              : null,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: currentPage == 0
                              ? Colors.teal.shade100.withOpacity(0.9)
                              : (currentPage == 1)
                                  ? Colors.indigo[100]!.withOpacity(0.9)
                                  : Colors.white,
                          width: 2.7,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      textStyle: TextStyle(
                        fontSize: 18.0,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    onPressed: () => controller.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut),
                    child: Text(
                      "Next",
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
