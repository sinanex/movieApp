import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Moviedetails extends StatelessWidget {
  String? image_path;
  String? title;
  String? overview;
  String? ogrinalName;

   Moviedetails({super.key,required this.title,required this.image_path,required this.ogrinalName,required this.overview});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            child: CachedNetworkImage(imageUrl: "https://image.tmdb.org/t/p/w500/$image_path", fit: BoxFit.fill,placeholder: (context, url) => Center(child: CircularProgressIndicator(),),),
          ),
          Text(title??'no data',style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),),
          Text(overview??'',style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w300,
          ),),
          // Text(ogrinalName??'')
        ],
      ),
    );
  }
}