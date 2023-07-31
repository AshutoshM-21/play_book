import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:play_book/home.dart';
import 'package:play_book/pages/library_screen.dart';
import 'package:play_book/pages/shop_screen.dart';
import 'package:play_book/pages/splash_screen.dart';
import 'package:provider/provider.dart';


import 'providers/bookData.dart';

void main() {
  runApp(const PlayBookApp());
}

class PlayBookApp extends StatelessWidget {
  const PlayBookApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => BookData()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        routes: {
          Home.id: (context) =>  Home(),
          Splash.id: (ctx) => const Splash(),
          LibraryScreen.routeName: (context) => LibraryScreen(navBarItem: [],),
          '/shop': (context) => ShopScreen(wishlistItems: []),
        },
        initialRoute: Splash.id,
      ),
    );
  }
}
