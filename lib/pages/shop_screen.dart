import 'package:flutter/material.dart';
import 'package:play_book/model/book.dart';
import 'package:provider/provider.dart';

import '../providers/bookData.dart';
import '../widgets/book_tile.dart';
import '../widgets/cat_tag.dart';
import '../widgets/search_bar.dart';

class ShopScreen extends StatelessWidget {
  final List<Book> wishlistItems; // Add the wishlistItems parameter

  ShopScreen({required this.wishlistItems});

  @override
  Widget build(BuildContext context) {
    final booksData = Provider.of<BookData>(context);
    final trendingBooks = booksData.trending;
    final novels = booksData.novels;
    final fantasy = booksData.fantasy;
    final adventure = booksData.adventure;

    return Scaffold(
      appBar: AppBar(
        title: Text('Shop'), // Set your desired title here
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back when back button is pressed
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(0),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          ),

          SearchBarWidget(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
            child: Text(
              'Popular Genres',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CatTag(color: Colors.red, tag: '📖 Novel'),
              CatTag(color: Colors.blue, tag: '⚡ Self-Help'),
              CatTag(color: Colors.green, tag: '🔮  Fantasy')
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CatTag(color: Colors.teal, tag: '🔪  True Crime'),
              CatTag(color: Colors.pink, tag: '🔬 Science Fiction Fantasy')
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 10, left: 16),
            child: Text(
              'Trending now',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.36,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: trendingBooks.length,
                itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
                  value: trendingBooks[index],
                  child: BookTile(
                    book: trendingBooks[index], wishlistItems: [],
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0, bottom: 10, left: 16),
            child: Text(
              'Adventure',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.36,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: adventure.length,
                itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
                  value: adventure[index],
                  child: BookTile(
                    book: adventure[index], wishlistItems: [],
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0, bottom: 10, left: 16),
            child: Text(
              'Novel',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.36,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: novels.length,
                itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
                  value: novels[index],
                  child: BookTile(
                    book: novels[index], wishlistItems: [],
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0, bottom: 10, left: 16),
            child: Text(
              'Fantasy',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.36,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: fantasy.length,
                itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
                  value: fantasy[index],
                  child: BookTile(
                    book: fantasy[index], wishlistItems: [],
                  ),
                )),
          ),


        ],
      ),
    );
  }
}
