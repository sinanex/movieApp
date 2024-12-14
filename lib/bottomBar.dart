import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/bottomBarprovider.dart';
import 'package:movieapp/home.dart';
import 'package:provider/provider.dart';

class BottomNAvigation extends StatelessWidget {
  final pages = [
    HomePage(),
    Center(child: Text("data"),),
    Center(child: Text("data"),),
    Center(child: Text("data"),)
  ];
   BottomNAvigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Bottombarprovider>(
      builder:(context, bar, child) =>  Scaffold(
        body: pages[bar.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: bar.currentIndex,
          onTap: (value) {
            bar.changeIndex(value);
          },
          items: [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.home,color: Colors.white,),label: 'home'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.search,color: Colors.white,),label: 'search'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.download_circle,color: Colors.white,),label: 'download'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.bars,color: Colors.white,),label: 'menu'),
        ]),
      ),
    );
  }
}