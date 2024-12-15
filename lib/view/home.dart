import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/view/bottomBar.dart';
import 'package:movieapp/view/movie.dart';
import 'package:movieapp/view/widget/movieCatogaryBase.dart';
import 'package:movieapp/controller/provider.dart';
import 'package:movieapp/view/tvShows.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
void initState() {
   Provider.of<movieProvider>(context, listen: false).trending();
    Provider.of<movieProvider>(context, listen: false).popular();
    Provider.of<movieProvider>(context, listen: false).upcoming();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<movieProvider>(

      builder:(context, value, child) { 
        if(value.isLodding == false){
          log("is lodding");
          return const Center(child: CircularProgressIndicator(),);
        }
        return 
        Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          toolbarHeight: 61,
          backgroundColor: Colors.transparent,
          flexibleSpace: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Image.asset(
                    'assests/WhatsApp_Image_2024-12-13_at_18.47.11-removebg-preview.png',
                    width: 70,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 9.0),
                    child: SizedBox(
                      width: 330,
                      height: 60,
                      child: Consumer<movieProvider>(
                        builder: (context, serch, child) => TextField(
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          controller: serch.serchCtrl,
                          onSubmitted: (value) {
                            serch.serchMovie();
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BottomNAvigation(intialState: 1,)));
                          },
                          decoration: InputDecoration(
                            fillColor: Colors.white.withOpacity(0.2),
                            filled: true,
                            suffixIcon: const Icon(Icons.search),
                            hintText: "Search",
                            hintStyle: style(),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Consumer<movieProvider>(
                builder: (context, movie, _) {
                  const imgUrl = 'https://image.tmdb.org/t/p/w500/';
                  return SizedBox(
                    width: double.infinity,
                    height: 650,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: CachedNetworkImage(
                              placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                              imageUrl:
                                  "$imgUrl${movie.TrendingMovie.first.posterpath}"),
                        ),
                        Positioned(
                          top: 125,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => tvShows(
                                                  title: "TV Shows",
                                                )));
                                  },
                                  child:
                                      Text("Tv Shows", style: appBarStyle())),
                              const SizedBox(
                                width: 150,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MoviePage(
                                                title: 'Movies',
                                              )));
                                },
                                child: Text(
                                  "Movies",
                                  style: appBarStyle(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                            bottom: 100,
                            child: Text("${movie.TrendingMovie.first.title}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 35))),
                        Positioned(
                          bottom: 20,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  const Icon(
                                    Icons.check,
                                    size: 40,
                                  ),
                                  Text(
                                    "My List",
                                    style: style(),
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              Container(
                                width: 120,
                                height: 50,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 240, 238, 238),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.play_arrow,
                                      color: Colors.black,
                                    ),
                                    Text(
                                      "Play",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              Column(
                                children: [
                                  const Icon(
                                    Icons.info_outline,
                                    size: 30,
                                  ),
                                  Text(
                                    "info",
                                    style: style(),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: Text(
                  "Trending Now",
                  style: appBarStyle(),
                ),
              ),
              Consumer<movieProvider>(
                builder: (context, value, child) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    moviecatogary(movieList: value.TrendingMovie),
                    Text(
                      "Popular Movies",
                      style: appBarStyle(),
                    ),
                    moviecatogary(movieList: value.popularMovie),
                    Text(
                      "Top Rated Movies",
                      style: appBarStyle(),
                    ),
                    moviecatogary(movieList: value.topRated),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
   } );
  }
}
