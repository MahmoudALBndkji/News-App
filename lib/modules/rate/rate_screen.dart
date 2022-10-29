import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:news_app/layout/news_app/cubit/themeModeCubit.dart';

class RateScreen extends StatefulWidget {
  @override
  State<RateScreen> createState() => _RateScreenState();
}

class _RateScreenState extends State<RateScreen> {
  double rate = 3.0;
  final NoteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rate"),
        actions: [
          Icon(
            Icons.star_rate_rounded,
            color: Colors.yellow[600],
            size: 30.0,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              ThemeModeCubit.get(context).isDark
                  ? "assets/images/rate3.gif"
                  : "assets/images/rate2.gif",
              height: MediaQuery.of(context).size.height / 3,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                  start: MediaQuery.of(context).size.width / 26.2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: MediaQuery.of(context).size.width / 26.2),
                    child: Text(
                      "bad",
                      style: TextStyle(
                        fontSize: 21.0,
                        fontStyle: FontStyle.italic,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Text(
                    "sad",
                    style: TextStyle(
                      fontSize: 21.0,
                      fontStyle: FontStyle.italic,
                      color: Colors.redAccent,
                    ),
                  ),
                  Text(
                    "naturle",
                    style: TextStyle(
                      fontSize: 21.0,
                      fontStyle: FontStyle.italic,
                      color: Colors.amber,
                    ),
                  ),
                  Text(
                    "happy",
                    style: TextStyle(
                      fontSize: 21.0,
                      fontStyle: FontStyle.italic,
                      color: Colors.lightGreen,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                        end: MediaQuery.of(context).size.width / 19.65),
                    child: Text(
                      "jolly",
                      style: TextStyle(
                        fontSize: 21.0,
                        fontStyle: FontStyle.italic,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            // RatingBar.builder(
            //   glow: false,
            //   allowHalfRating: true,
            //   itemPadding: EdgeInsets.symmetric(horizontal: 8.0),
            //   itemSize: 50,
            //   itemCount: 5,
            //   minRating: 0.5,
            //   initialRating: 2,
            //   onRatingUpdate: (value) => setState(() => rate = value),
            //   itemBuilder: (context, index) => Icon(
            //     Icons.star_rate,
            //     color: Colors.yellow[600],
            //   ),
            // ),
            RatingBar.builder(
              initialRating: 3,
              itemSize: 50,
              itemPadding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 30),
              glow: false,
              allowHalfRating: true,
              itemCount: 5,
              maxRating: 5.0,
              minRating: 0.5,
              onRatingUpdate: (rating) => setState(() => rate = rating),
              itemBuilder: (context, index) {
                switch (index) {
                  case 0:
                    return const Icon(
                      Icons.sentiment_very_dissatisfied,
                      color: Colors.red,
                    );
                  case 1:
                    return const Icon(
                      Icons.sentiment_dissatisfied,
                      color: Colors.redAccent,
                    );
                  case 2:
                    return const Icon(
                      Icons.sentiment_neutral,
                      color: Colors.amber,
                    );
                  case 3:
                    return const Icon(
                      Icons.sentiment_satisfied,
                      color: Colors.lightGreen,
                    );
                  case 4:
                    return const Icon(
                      Icons.sentiment_very_satisfied,
                      color: Colors.green,
                    );
                  default:
                    return const Icon(
                      Icons.sentiment_very_satisfied,
                      color: Colors.green,
                    );
                }
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Rating : $rate",
              style: TextStyle(
                fontSize: 24.0,
                fontStyle: FontStyle.italic,
                color: rate >= 0.0 && rate <= 1.0
                    ? Colors.red
                    : (rate > 1.0 && rate <= 2.0)
                        ? Colors.redAccent
                        : (rate > 2.0 && rate <= 3.0)
                            ? Colors.amber
                            : (rate > 3.0 && rate <= 4.0)
                                ? Colors.lightGreen
                                : Colors.green,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.width / 19.65),
              child: TextFormField(
                controller: NoteController,
                minLines: 4,
                maxLines: 7,
                keyboardType: TextInputType.text,
                style: TextStyle(
                  fontSize: 18.0,
                ),
                decoration: InputDecoration(
                  hintText: "Set note for us.....",
                  hintStyle: TextStyle(
                      fontSize: 22.0,
                      color: ThemeModeCubit.get(context).isDark
                          ? Colors.white
                          : Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                  EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 9.825,
                      vertical: MediaQuery.of(context).size.width / 49.125),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: BorderSide(
                      color: Colors.grey,
                      width: 2,
                    ),
                  ),
                ),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Thanks for Rate",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Icon(
                          Icons.favorite_outlined,
                          color: Colors.pink,
                        ),
                      ],
                    ),
                  ),
                );
                Timer(
                  Duration(seconds: 1),
                  () => Navigator.pop(context),
                );
              },
              // onPressed: () => Navigator.pop(context),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Send",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Icon(
                    Icons.send,
                    size: 20.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
