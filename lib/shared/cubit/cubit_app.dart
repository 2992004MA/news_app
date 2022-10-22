import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/news_states.dart';
import 'package:news_app/modules/bussiness/bussiness_news.dart';
import 'package:news_app/modules/science/science_news.dart';
import 'package:news_app/modules/sports/sports_news.dart';
import 'package:news_app/shared/cubit/states_app.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens = [
    BussinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavBar());
  }

  bool isDark = false;

  void changeModeApp({bool? fromShared}) {
    if(fromShared != null) {
      isDark = fromShared;
      emit(AppChangeMode());
    }
    else{
      isDark = !isDark;
      CacheHelper.saveData(key: 'isDark', value: isDark).then((value) {
        emit(AppChangeMode());
      });
    }
  }
}