import 'package:flutter/material.dart';
import 'package:play_book/model/Explore_book.dart';
import 'package:play_book/providers/bookData.dart';
import 'package:play_book/utils/list.dart';
import 'package:play_book/widgets/book_tile.dart';
import 'package:provider/provider.dart';

class AudiobookTabContent extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final booksData = Provider.of<BookData>(context);
    final trendingBooks = booksData.trending;
    final novels = booksData.novels;
    final fantasy = booksData.fantasy;
    final adventure = booksData.adventure;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Explore Play Books",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 100, // <-- Adjust the height as needed
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  4,
                      (index) =>
                      Column(
                        children: [
                          ExploreBook(
                            icon: exploreIcons[index],
                            title: titles[index],
                          ),
                        ],
                      ),
                ).toList(),
              ),
            ),
          ),
          SizedBox(height: 10),
          Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 16),
                  child: Text(
                    'Trending Now',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10, left: 16),
                  child: Text(
                    'Most Popular on Play Book',
                    // Replace this with your desired text
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: MediaQuery
                .of(context)
                .size
                .height * 0.36,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: trendingBooks.length,
                itemBuilder: (ctx, index) =>
                    ChangeNotifierProvider.value(
                      value: trendingBooks[index],
                      child: BookTile(
                        book: trendingBooks[index], wishlistItems: [],
                      ),
                    )),
          ),
          SizedBox(height: 10),
          Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 16),
                  child: Text(
                    'Trending Now',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10, left: 16),
                  child: Text(
                    'Most Popular on Play Book',
                    // Replace this with your desired text
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: MediaQuery
                .of(context)
                .size
                .height * 0.36,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: adventure.length,
                itemBuilder: (ctx, index) =>
                    ChangeNotifierProvider.value(
                      value: adventure[index],
                      child: BookTile(
                        book: adventure[index], wishlistItems: [],
                      ),
                    )),
          ),
          SizedBox(height: 10),
          Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 16),
                  child: Text(
                    'Trending Now',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10, left: 16),
                  child: Text(
                    'Most Popular on Play Book',
                    // Replace this with your desired text
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: MediaQuery
                .of(context)
                .size
                .height * 0.5,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: novels.length,
                itemBuilder: (ctx, index) =>
                    ChangeNotifierProvider.value(
                      value: novels[index],
                      child: BookTile(
                        book: novels[index], wishlistItems: [],
                      ),
                    )),
          ),
          SizedBox(height: 10),
          Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 16),
                  child: Text(
                    'Trending Now',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10, left: 16),
                  child: Text(
                    'Most Popular on Play Book',
                    // Replace this with your desired text
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: MediaQuery
                .of(context)
                .size
                .height * 0.5,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: fantasy.length,
                itemBuilder: (ctx, index) =>
                    ChangeNotifierProvider.value(
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