import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/controller/bottomBarprovider.dart';
import 'package:movieapp/view/home.dart';
import 'package:movieapp/view/searchPage.dart';
import 'package:provider/provider.dart';

class BottomNAvigation extends StatefulWidget {
int intialState;
   BottomNAvigation({super.key, required this.intialState});

  @override
  State<BottomNAvigation> createState() => _BottomNAvigationState();
}

class _BottomNAvigationState extends State<BottomNAvigation> {
  final pages = [
    HomePage(),
   Searchpage(),
    Center(child: Text("data"),),
    Center(child: Text("data"),)
  ];
@override
  void initState() {
    // TODO: implement initState
    Provider.of<Bottombarprovider>(context,listen: false).currentIndex = widget.intialState;
    super.initState();
  }
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