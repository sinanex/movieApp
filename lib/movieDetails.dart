import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/home.dart';
import 'package:movieapp/movieCatogaryBase.dart';

class Moviedetails extends StatelessWidget {
  String? image_path;
  String? title;
  String? overview;
  String? ogrinalName;
  String? type;

  Moviedetails(
      {super.key,
      required this.type,
      required this.title,
      required this.image_path,
      required this.ogrinalName,
      required this.overview});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: CachedNetworkImage(
                  imageUrl: "https://image.tmdb.org/t/p/w500/$image_path",
                  fit: BoxFit.fill,
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image.asset(
                      'assests/WhatsApp_Image_2024-12-13_at_18.47.11-removebg-preview.png',
                      width: 40,
                    ),
                    Text(
                      "Movie",
                      style: style(),
                    ),
                  ],
                ),
              ),
              Text(
                ' $title',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.play_arrow),
                      Text(
                        "Play",
                        style: style(),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red[600],
                  ),
                ),
              ),
              Text(
                overview ?? '',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Icon(CupertinoIcons.check_mark),
                        Text(
                          "My List",
                          style: style(),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Icon(CupertinoIcons.hand_thumbsup),
                        Text(
                          "Like",
                          style: style(),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Icon(CupertinoIcons.share),
                        Text(
                          "Share",
                          style: style(),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 150,
                    )
                  ],
                ),
              ),
              Divider(
                color: Colors.grey,
              ),
              Text(
                "Trailers and More",
                style: appBarStyle(),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 250,
                      child: CachedNetworkImage(
                        imageUrl: "https://image.tmdb.org/t/p/w500/$image_path",
                        fit: BoxFit.fill,
                        placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
