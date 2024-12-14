import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/movieCatogaryBase.dart';
import 'package:movieapp/provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<movieProvider>(context, listen: false).trending();
    Provider.of<movieProvider>(context, listen: false).popular();
    Provider.of<movieProvider>(context, listen: false).upcoming();
  }

  @override
  Widget build(BuildContext context) {
    // MovieServices m = MovieServices();
    // m.display();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 61,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          child: Column(
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
                      child: TextField(
                        
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
                ],
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Expanded(
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
                                  "$imgUrl${movie.TrendingMovie[14].posterpath}"),
                        ),
                        Positioned(
                          top: 125,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("Tv Shows", style: appBarStyle()),
                              const SizedBox(
                                width: 150,
                              ),
                              Text(
                                "Movies",
                                style: appBarStyle(),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                            bottom: 100,
                            child: Text("${movie.TrendingMovie[14].title}",
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
      ),
    );
  }
}
