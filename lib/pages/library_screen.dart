import 'package:flutter/material.dart';
import 'package:play_book/home_controller.dart';
import 'package:play_book/widgets/search_bar.dart';
import 'package:provider/provider.dart';
import 'package:play_book/model/book.dart';
import 'package:play_book/pages/book_details.dart';
import 'package:play_book/providers/bookData.dart';
import 'package:play_book/pages/wishlist_screen.dart'; // Import WishlistScreen
import 'package:get/get.dart'; // Import GetX

class LibraryScreen extends StatelessWidget {
  final List<BottomNavigationBarItem> navBarItem;

  LibraryScreen({required this.navBarItem});

  static const routeName = '/library';

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<HomeController>();
    var libraryBooks = Provider.of<BookData>(context).libraryBooks;
    var isLibraryEmpty = libraryBooks.isEmpty;

    return Scaffold(
      appBar: AppBar(
        title: Text('Library'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SearchBarWidget(),
          ),
          isLibraryEmpty
              ? Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/selling.png',
                    width: 150, // Adjust the width as needed
                    height: 150, // Adjust the height as needed
                  ),
                  SizedBox(height: 20),

                  Text(
                    "You haven't added any book yet.",
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the shop screen
                      Navigator.pushNamed(context, '/shop');
                    },
                    child: Text("Go to Shop"),
                  ),
                ],
              ),
            ),
          )
              : Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: libraryBooks.length,
              itemBuilder: (context, index) {
                Book book = libraryBooks[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookDetailsPage(
                          book: book,
                          wishlistItems: [],
                        ),
                      ),
                    );
                  },
                  child: GridTile(
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.network(
                            book.thumbnailUrl.toString(),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Text(
                            book.title.toString(),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}