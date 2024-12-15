import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/controller/provider.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class tvShows extends StatelessWidget {
  String? title;
  tvShows({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    Provider.of<movieProvider>(context, listen: false).tvshows();
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? ''),
      ),
      body: Consumer<movieProvider>(builder: (context, value, child) {
        if (title == 'Movie') {
          return Center(
            child: Text("data"),
          );
        } else {
          return ListView.builder(
              itemCount: value.tvList.length,
              itemBuilder: (context, index) {
                final data = value.tvList[index];
                return Container(
                  child: Stack(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 250,
                        child: CachedNetworkImage(
                            errorWidget: (context, url, error) {
                              return const Center(
                                child: Icon(Icons.error_outline),
                              );
                            },
                            placeholder: (context, url) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                            imageUrl:
                                'https://image.tmdb.org/t/p/w500/${data.backdroppath}'),
                      ),
                      Text(data.name!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 23,
                          )),
                      Positioned(
                        bottom: 15,
                        right: 15,
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.play_circle,
                              size: 50,
                              color: Colors.white,
                            )),
                      )
                    ],
                  ),
                );
              });
        }
      }),
    );
  }
}
