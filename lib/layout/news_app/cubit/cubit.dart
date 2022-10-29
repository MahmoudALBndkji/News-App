import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/cubit/states.dart';
import 'package:news_app/layout/news_app/cubit/themeModeCubit.dart';
import 'package:news_app/layout/news_app/cubit/themeModeCubit.dart';
import 'package:news_app/layout/news_app/cubit/themeModeCubit.dart';
import 'package:news_app/modules/business/business_screen.dart';
import 'package:news_app/modules/science/science_screen.dart';
import 'package:news_app/modules/settings_screen/settings_screen.dart';
import 'package:news_app/modules/sports/sports_screen.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  List<Widget> curvedBottomItems(context) {
    return [
      Container(
        height: 50,
        child: Column(
          children: [
            Icon(
              Icons.business,
              color: Colors.blue,
              size: 30.0,
            ),
            Text(
              "Business",
              style: TextStyle(
                color: ThemeModeCubit.get(context).isDark
                    ? Colors.white
                    : Colors.black,
              ),
            )
          ],
        ),
      ),
      Container(
        height: 50,
        child: Column(
          children: [
            Icon(
              Icons.sports,
              color: Colors.blue,
              size: 30.0,
            ),
            Text(
              "Sports",
              style: TextStyle(
                color: ThemeModeCubit.get(context).isDark
                    ? Colors.white
                    : Colors.black,
              ),
            )
          ],
        ),
      ),
      Container(
        height: 50,
        child: Column(
          children: [
            Icon(
              Icons.science,
              color: Colors.blue,
              size: 30.0,
            ),
            Text(
              "Science",
              style: TextStyle(
                color: ThemeModeCubit.get(context).isDark
                    ? Colors.white
                    : Colors.black,
              ),
            )
          ],
        ),
      ),
      // Icon(
      //   Icons.business,
      //   color: Colors.blue,
      // ),
      // // label: 'Business',
      // Icon(
      //   Icons.sports,
      //   color: Colors.blue,
      // ),
      // // label: 'Sports',
      // Icon(
      //   Icons.science,
      //   color: Colors.blue,
      // ),
      // label: 'Science',
    ];
  }

  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];
  List<String> titles = ['Business', 'Sports', 'Science'];
  List<IconData> icons = [
    Icons.business_center,
    Icons.sports_basketball_outlined,
    Icons.science_rounded,
  ];
  List<Color> colors = [
    Colors.brown,
    Colors.blue[400]!,
    Colors.orangeAccent,
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (index == 1) getSports();
    if (index == 2) getScience();
    emit(NewsBottomNavState());
  }

  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> science = [];

  void getBusiness() {
    emit(NewsGetBusinessLodingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'us',
        'category': 'business',
        'apiKey': '29f1ddfc12d144bc8c8ddbae517ff773',
      },
    ).then((value) {
      business = value.data['articles'];
      print(business[0]['title']);
      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  void getSports() {
    emit(NewsGetSportsLodingState());
    if (sports.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'sports',
          'apiKey': '29f1ddfc12d144bc8c8ddbae517ff773',
        },
      ).then((value) {
        sports = value.data['articles'];
        print(sports[0]['title']);
        emit(NewsGetSportsSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetSportsErrorState(error.toString()));
      });
    } else
      emit(NewsGetSportsSuccessState());
  }

  void getScience() {
    emit(NewsGetScienceLodingState());
    if (science.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'science',
          'apiKey': '29f1ddfc12d144bc8c8ddbae517ff773',
        },
      ).then((value) {
        science = value.data['articles'];
        print(science[0]['title']);
        emit(NewsGetScienceSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetScienceErrorState(error.toString()));
      });
    } else
      emit(NewsGetScienceSuccessState());
  }

  List<dynamic> search = [];

  void getSearch(String value) {
    emit(NewsGetSearchLodingState());
    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': '$value',
        'apiKey': '29f1ddfc12d144bc8c8ddbae517ff773',
      },
    ).then((value) {
      search = value.data['articles'];
      // print(search[0]['title']);
      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }
}
