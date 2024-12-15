import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/view/bottomBar.dart';
import 'package:movieapp/view/widget/movieCatogaryBase.dart';
import 'package:movieapp/controller/provider.dart';
import 'package:provider/provider.dart';

class Searchpage extends StatelessWidget {
  String? value;
  Searchpage({super.key, this.value});

  @override
  Widget build(BuildContext context) {
    bool isLodding =
        Provider.of<movieProvider>(context, listen: false).isLodding;
    if (isLodding == false) {
      Center(
        child: CircularProgressIndicator(),
      );
    }
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          automaticallyImplyLeading: false,
          flexibleSpace: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  BottomNAvigation(intialState: 0)));
                    },
                    child: Icon(Icons.arrow_back_ios)),
              ),
              Expanded(
                child: Consumer<movieProvider>(
                  builder: (context, serch, child) => TextField(
                    onSubmitted: (value) {
                      serch.serchMovie();
                    },
                    controller: serch.serchCtrl,
                    decoration: InputDecoration(
                        hintText: 'search',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Consumer<movieProvider>(
                builder: (context, value, child) => ListView.builder(
                    itemCount: value.serchList.length,
                    itemBuilder: (context, index) {
                      final data = value.serchList[index];
                      return Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CachedNetworkImage(
                              placeholder: (context, url) {
                                return Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                );
                              },
                              errorWidget: (context, url, error) {
                                return Icon(Icons.error_outline);
                              },
                              imageUrl:
                                  'https://image.tmdb.org/t/p/w500/${data.posterpath}',
                              width: 100,
                            ),
                            Text(
                              data.title ?? '',
                              style: style(),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
