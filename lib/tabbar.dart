import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/movieDetails.dart';
import 'package:movieapp/provider.dart';
import 'package:provider/provider.dart';

class TrendingPage extends StatelessWidget {
  const TrendingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<movieProvider>(context, listen: false).isLodding;
    Provider.of<movieProvider>(context, listen: false).getData();
    if (provider == false) {
      Center(
        child: CircularProgressIndicator(),
      );
    }
    return Scaffold(
      body: Consumer<movieProvider>(
        builder: (context, value, child) => GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 0, mainAxisSpacing: 20, crossAxisCount: 3),
          itemCount: value.movieList.length,
          itemBuilder: (context, index) {
            final data = value.movieList[index];
            return GestureDetector(
              onTap: () {
                // MovieServices movie = MovieServices();
                // movie.display(data.);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Moviedetails(
                          ogrinalName: data.original,
                          overview: data.overview,
                          image_path: data.backdroppath,
                              title: data.title,
                            )));
              },
              child: Container(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: CachedNetworkImage(
                              imageUrl:
                                  'https://image.tmdb.org/t/p/w500/${data.posterpath}',
                              fit: BoxFit.contain,
                            )))),
              ),
            );
          },
        ),
      ),
    );
  }
}
