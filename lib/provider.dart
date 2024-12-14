import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movieapp/model.dart';
import 'package:movieapp/services.dart';

class movieProvider extends ChangeNotifier {
  TextEditingController serchCtrl = TextEditingController();
  List<result> TrendingMovie = [];
  List<result> popularMovie = [];
  List<result> topRated = [];
  List<result> serchList = [];

  bool isLodding = false;
  MovieServices movieServices = MovieServices();

  void popular() async {
    popularMovie = await movieServices.popularMovie();
    notifyListeners();
    if (popularMovie.isNotEmpty) {
      log("Data get success");
      isLodding =true;
      notifyListeners();
    } else {
      log("error");
    }
  }
    void upcoming() async {
    topRated = await movieServices.upcomingMovie();
    notifyListeners();
    if (topRated.isNotEmpty) {
      log("toprated get success");
      isLodding =true;
      notifyListeners();
    } else {
      log("error");
    }
  }
  void trending()async{
    TrendingMovie = await movieServices.trendingMovie();
    notifyListeners();
    if (popularMovie.isNotEmpty) {
      log("trending get success");
      isLodding =true;
      notifyListeners();
    } else {
      log("error");
    }
  }

  void serchMovie(String? movieserch) async {
    try {
      serchList = await movieServices.searchData(movie: movieserch ?? '');
      notifyListeners();
    } catch (e) {
      log("$e");
    }
    notifyListeners();
  }
}


