import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:play_book/home.dart';
import 'package:play_book/home_controller.dart';
import 'package:play_book/model/book.dart';
import 'package:play_book/pages/homeScreen.dart';
import 'package:play_book/pages/library_screen.dart';
import 'package:play_book/pages/shop_screen.dart';
import 'package:play_book/pages/wishlist_screen.dart';

class Home extends StatelessWidget {
  static String id = "/";
   Home({super.key});

  final List<Book> wishlistItems = [];
  @override
  Widget build(BuildContext context) {
    var controller= Get.put(HomeController());
    var navBarItem=[
      BottomNavigationBarItem(icon: Icon(Icons.home),label: 'home' ),
      BottomNavigationBarItem(icon: Icon(Icons.library_books_outlined),label: 'library' ),
      BottomNavigationBarItem(icon: Icon(Icons.library_add),label: 'wishlist' ),
      BottomNavigationBarItem(icon: Icon(Icons.shop_two_sharp),label: 'shop' )
    ];
    var navBody = [
      const HomeScreen(),
      LibraryScreen(navBarItem: navBarItem),
      WishlistPage(wishlistItems: wishlistItems), // Pass the wishlistItems list here
      ShopScreen(wishlistItems: [],),
    ];
    return Scaffold(
      body: Column(
        children: [
         Obx(() => Expanded(child: navBody.elementAt(controller.currentNavIndex.value),),),
        ],
      ),
      bottomNavigationBar: Obx(

        ()=> BottomNavigationBar(
          currentIndex: controller.currentNavIndex.value,
        selectedItemColor:Colors.blue,
        type: BottomNavigationBarType.fixed,
        items: navBarItem,
          onTap: (value) {
            controller.currentNavIndex.value = value;
          },
    ),
      ),
    );
  }
}
