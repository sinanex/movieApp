
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/bottomBar.dart';
import 'package:movieapp/bottomBarprovider.dart';
import 'package:movieapp/provider.dart';
import 'package:provider/provider.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => movieProvider(),),
        ChangeNotifierProvider(create: (context) => Bottombarprovider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData.dark(),
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme()
        ),
        home: BottomNAvigation(),
      ),
    );
  }
}