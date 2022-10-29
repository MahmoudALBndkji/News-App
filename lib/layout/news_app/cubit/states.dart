abstract class NewsStates {}
class NewsInitialState extends NewsStates {}
class NewsBottomNavState extends NewsStates {}
class NewsGetBusinessSuccessState extends NewsStates {}
class NewsGetBusinessLodingState extends NewsStates {}
class NewsGetBusinessErrorState extends NewsStates {
  final String error;

  NewsGetBusinessErrorState(this.error);

}

class NewsGetSportsSuccessState extends NewsStates {}
class NewsGetSportsLodingState extends NewsStates {}
class NewsGetSportsErrorState extends NewsStates {
  final String error;

  NewsGetSportsErrorState(this.error);

}
class NewsGetScienceSuccessState extends NewsStates {}
class NewsGetScienceLodingState extends NewsStates {}
class NewsGetScienceErrorState extends NewsStates {
  final String error;

  NewsGetScienceErrorState(this.error);

}

class AppChangeModeState extends NewsStates {}

class NewsGetSearchSuccessState extends NewsStates {}
class NewsGetSearchLodingState extends NewsStates {}
class NewsGetSearchErrorState extends NewsStates {
  final String error;

  NewsGetSearchErrorState(this.error);

}
