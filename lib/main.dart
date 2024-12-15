
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/view/bottomBar.dart';
import 'package:movieapp/controller/bottomBarprovider.dart';
import 'package:movieapp/controller/provider.dart';
import 'package:movieapp/view/splash.dart';
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
        home: SplashScreen(),
      ),
    );
  }
}