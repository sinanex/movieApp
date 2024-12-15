import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/view/movieDetails.dart';

Widget moviecatogary({required List<dynamic> movieList}) {
  if (movieList.isEmpty) {
   return Center(child: CircularProgressIndicator(),);
  }
    return SizedBox(
      height: 250,
      child: ListView.builder(
      itemCount: movieList.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final data = movieList[index];
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            width: 150,
            height: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Moviedetails(
                              type: data.type,
                              title: data.title,
                              image_path: data.backdroppath,
                              ogrinalName: data.original,
                              overview: data.overview)));
                },
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  imageUrl:
                      'https://image.tmdb.org/t/p/w300/${data.posterpath}',
                  width: 140, // Thumbnail width
                ),
              ),
            ),
          ),
        );
      },
      ),
    );
  }

  TextStyle style() {
  return const TextStyle(
      fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white);
}

TextStyle appBarStyle() {
  return const TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontSize: 18,
  );
}
