import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movieapp/model/model.dart';
import 'package:movieapp/services/services.dart';

class movieProvider extends ChangeNotifier {
  TextEditingController serchCtrl = TextEditingController();
  List<result> TrendingMovie = [];
  List<result> popularMovie = [];
  List<result> topRated = [];
  List<result> serchList = [];
  List<result> tvList =[];
  List<result> movies =[];


  bool isLodding = false;
  MovieServices movieServices = MovieServices();

  void tvshows() async {
    tvList = await movieServices.tvshows();
    notifyListeners();
    if (tvList.isNotEmpty) {
      log("tv get success");
      isLodding =true;
      notifyListeners();
    } else {
      log("error");
    }
  }
  void movie() async {
    movies = await movieServices.movies();
    notifyListeners();
    if (movies.isNotEmpty) {
      log("movies get success");
      isLodding =true;
      notifyListeners();
    } else {
      log("error");
    }
  }

  void popular() async {
    popularMovie = await movieServices.popularMovie();
    notifyListeners();
    if (popularMovie.isNotEmpty) {
      log("popular get success");
      notifyListeners();
    } else {
      log("error");
    }
    notifyListeners();
  }
    void upcoming() async {
    topRated = await movieServices.upcomingMovie();
    notifyListeners();
    if (topRated.isNotEmpty) {
      log("toprated get success");
    } else {
      log("error");
    }
    notifyListeners();
  }
  void trending()async{
    TrendingMovie = await movieServices.trendingMovie();
    notifyListeners();
    if (TrendingMovie.isNotEmpty) {
      log("trending get success.......");
      isLodding =true;
      notifyListeners();
    } else {
      log("error");
      isLodding = false;
    }
    notifyListeners();
  }

  void serchMovie() async {
    try {
      serchList = await movieServices.searchData(movie: serchCtrl.text);
       if(serchList.isNotEmpty){
        isLodding = true;
       }else{
        isLodding = false;
       }
      notifyListeners();
    } catch (e) {
      log("$e");
    }
     if(serchList.isNotEmpty){
        print("search data fetch sucess");
      }else{
        print("error search");
      }
    notifyListeners();
  }
}


