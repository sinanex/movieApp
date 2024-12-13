  import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:movieapp/model.dart';

class MovieServices{
    Future<List<result>> fetchData() async {
  final url = 'https://api.themoviedb.org/3/movie/popular?api_key=d26a8dd97ecb04414d11287cd30cca91';
  Dio dio = Dio();

  try {
    final response = await dio.get(url);
    if (response.statusCode == 200) {
      log("Request successful: ${response.statusMessage}");
      final List data = response.data['results'];
      return data.map((movie) => result.fromJson(movie)).toList();
    } else {
      log("Error: ${response.statusCode} - ${response.statusMessage}");
    }
  } catch (e) {
    log("Exception: $e");
  }

  return [];
}
  Future<result?> displayDetails({required String id})async{
      Dio dio = Dio();
    final url = 'https://api.themoviedb.org/3/movie/$id?api_key=d26a8dd97ecb04414d11287cd30cca91';
    try {
     final response = await dio.get(url);
     if(response.statusCode == 200){
   
      return result.fromJson(response.data);
     }
    } catch (e) {
      log("$e");
    }
    return null;
  }

      Future<List<result>> searchData() async {
  final url = 'https://api.themoviedb.org/3/movie/popular?api_key=d26a8dd97ecb04414d11287cd30cca91';
  Dio dio = Dio();

  try {
    final response = await dio.get(url);
    if (response.statusCode == 200) {
      log("Request successful: ${response.statusMessage}");
      final List data = response.data['results'];
      return data.map((movie) => result.fromJson(movie)).toList();
    } else {
      log("Error: ${response.statusCode} - ${response.statusMessage}");
    }
  } catch (e) {
    log("Exception: $e");
  }

  return [];
}
   
  }

