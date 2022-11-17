import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/layout/news_app/cubit/cubit.dart';
import 'package:news_app/layout/news_app/cubit/themeModeCubit.dart';
import 'package:news_app/layout/news_app/cubit/themeModeState.dart';
import 'package:news_app/layout/news_app/newsLayout.dart';
import 'package:news_app/modules/onBoardingPage/onBoardingPage.dart';
import 'package:news_app/shared/bloc_observer.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // if main is (async) we used this for check for All
  // in Method is executed Then Run This Application
  WidgetsFlutterBinding.ensureInitialized();
  // For Prevent Screen Rotation
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getBoolean(key: 'isDark');
  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;
  runApp(MyApp(isDark: isDark, showHome: showHome));
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  final bool? showHome;

  MyApp({this.isDark, this.showHome});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
          NewsCubit()
            ..getBusiness(),
        ),
        BlocProvider(
          create: (context) =>
          ThemeModeCubit()
            ..changeAppMode(fromShared: isDark),
        )
      ],
      child: BlocConsumer<ThemeModeCubit, ThemeModeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              primarySwatch: Colors.blue,
              appBarTheme: AppBarTheme(
                  titleSpacing: 10,
                  // backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark,
                  ),
                  backgroundColor: Colors.white70,
                  elevation: 5.0,
                  titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  iconTheme: IconThemeData(color: Colors.black)),
              scaffoldBackgroundColor: Colors.white,
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.blue[400]!,
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.blue[400]!,
                unselectedItemColor: Colors.grey,
                elevation: 20.0,
                backgroundColor: Colors.white,
              ),
            ),
            darkTheme: ThemeData(
              primarySwatch: Colors.blue,
              appBarTheme: AppBarTheme(
                titleSpacing: 20,
                // backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: HexColor('333739'),
                  statusBarIconBrightness: Brightness.light,
                ),
                backgroundColor: HexColor('343639'),
                elevation: 5.0,
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                iconTheme: IconThemeData(color: Colors.white),
              ),
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.blue[400]!,
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.blue[400]!,
                unselectedItemColor: Colors.grey,
                elevation: 20.0,
                backgroundColor: HexColor('333739'),
              ),
              // The Old Color
              // scaffoldBackgroundColor: HexColor('333739'),
              scaffoldBackgroundColor: HexColor('#292C2E'),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            themeMode: ThemeModeCubit
                .get(context)
                .isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: Directionality(
              child: showHome! ? NewsLayout() : OnBoardingPage(),
              textDirection: TextDirection.ltr,
            ),
          );
        },
      ),
    );
  }
}

