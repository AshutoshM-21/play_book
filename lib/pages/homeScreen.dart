

import 'package:flutter/material.dart';
import 'package:play_book/model/Audiobook.dart';
import 'package:play_book/model/Ebook.dart';

import 'package:play_book/model/Explore_book.dart';
import 'package:play_book/pages/Book_details.dart';
import 'package:play_book/providers/bookData.dart';
import 'package:play_book/utils/list.dart';
import 'package:play_book/utils/strings.dart';
import 'package:play_book/widgets/book_tile.dart';
import 'package:provider/provider.dart';
import '../widgets/search_bar.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    final screenHeight = MediaQuery
        .of(context)
        .size
        .height;


    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(12),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  ),
                  SearchBarWidget(),
                  SizedBox(height: 20),
                  Container(

                    padding: EdgeInsets.all(16),
                    alignment: Alignment.center,
                    child: Text(
                      "Lets find your next read",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(

                    padding: EdgeInsets.all(16),
                    alignment: Alignment.center,
                    child: Text(
                      "from romance to superheroes to Thai Cuisine, we have tons of books for all your interests",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/shop');
                      },
                      child: Text("Shop For books"),
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  TabBar(
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.blue,
                    tabs: [
                      Tab(text: "Ebook"),
                      Tab(text: "Audiobook"),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        EbookTabContent(),
                        AudiobookTabContent(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}