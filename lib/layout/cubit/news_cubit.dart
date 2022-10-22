import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/news_states.dart';
import 'package:news_app/modules/bussiness/bussiness_news.dart';
import 'package:news_app/modules/science/science_news.dart';
import 'package:news_app/modules/sports/sports_news.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  List<dynamic> business = [];
  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country' : 'eg',
      'category' : 'business',
      'apiKey' : '26d37d8625d44d6295bbd393fa7c760b',
    }).then((value) {
      print(value.data['articles'][0]['title']);
      business = value.data['articles'];
      emit(NewsGetBusinessSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetBusinessErrorState());
    });
  }

  List<dynamic> sports = [];
  void getSports() {
    emit(NewsGetSportsLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country' : 'eg',
      'category' : 'sports',
      'apiKey' : '26d37d8625d44d6295bbd393fa7c760b',
    }).then((value) {
      print(value.data['articles'][0]['title']);
      sports = value.data['articles'];
      emit(NewsGetSportsSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetSportsErrorState());
    });
  }

  List<dynamic> science = [];
  void getScience() {
    emit(NewsGetScienceLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country' : 'eg',
      'category' : 'science',
      'apiKey' : '26d37d8625d44d6295bbd393fa7c760b',
    }).then((value) {
      print(value.data['articles'][0]['title']);
      science = value.data['articles'];
      emit(NewsGetScienceSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetScienceErrorState());
    });
  }

  List<dynamic> search = [];
  void getSearch(String value) {
    emit(NewsGetSearchLoadingState());
    DioHelper.getData(url: 'v2/everything', query: {
      'q' : '$value',
      'apiKey' : '26d37d8625d44d6295bbd393fa7c760b',
    }).then((value) {
      search = value.data['articles'];
      emit(NewsGetSearchSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetSearchErrorState());
    });
  }
}
