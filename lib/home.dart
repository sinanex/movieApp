import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/provider.dart';
import 'package:movieapp/tabbar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 27, 31, 37),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "What you want to watch?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search movies...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 77, 71, 71),
                ),
              ),
            ),
            Expanded(
              child: Consumer<movieProvider>(
                builder: (context, value, child) => ListView.builder(
                  itemCount: value.movieList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final image = value.movieList[index];
                    return Padding(
                        padding: const EdgeInsets.all(15.0),
                    
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: CachedNetworkImage(
                              fit: BoxFit.contain,
                               placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                              imageUrl:
                                  'https://image.tmdb.org/t/p/w200/${image.posterpath}',
                            ),
                          ),
                        );
                  },
                ),
              ),
            ),
            Expanded(
              child: DefaultTabController(
                length: 4,
                child: Column(
                  children: [
                    TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelStyle: style(),
                      unselectedLabelColor: Colors.white,
                      indicatorColor: const Color.fromARGB(255, 105, 104, 104),
                      labelColor: Colors.white,
                      dividerColor: Color.fromARGB(255, 27, 31, 37),
                      tabs: [
                        Tab(
                          text: 'Trending',
                        ),
                        Tab(
                          text: 'Up coming',
                        ),
                        Tab(
                          text: 'Top rated',
                        ),
                        Tab(
                          text: 'Popular',
                        ),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          TrendingPage(),
                          Center(
                              child: Text('top Rated ',
                                  style: TextStyle(color: Colors.white))),
                          Center(
                              child: Text('Profile',
                                  style: TextStyle(color: Colors.white))),
                          Center(
                              child: Text('Profile',
                                  style: TextStyle(color: Colors.white))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

TextStyle style() {
  return TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );
}
