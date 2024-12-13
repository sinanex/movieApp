import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movieapp/model.dart';
import 'package:movieapp/services.dart';

class movieProvider extends ChangeNotifier{
  List<result> movieList = [];
  String? imageList;
  bool isLodding = false;
  MovieServices movieServices = MovieServices();

  void getData()async{
    movieList = await movieServices.fetchData();
    isLodding = true;
    notifyListeners();
    if(movieList.isNotEmpty){
      log("Data get success");
    }else{
     log("error");
    }
  }
  

  
}

