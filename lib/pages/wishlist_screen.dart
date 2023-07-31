import 'package:flutter/material.dart';
import 'package:play_book/model/book.dart';
import 'package:play_book/pages/Book_details.dart';
import 'package:play_book/providers/bookData.dart';
import 'package:play_book/widgets/search_bar.dart';
import 'package:provider/provider.dart';
import 'shop_screen.dart';

class WishlistPage extends StatelessWidget {
  final List<Book> wishlistItems;

  WishlistPage({required this.wishlistItems});

  void removeFromWishlist(BuildContext context, Book book) {
    Provider.of<BookData>(context, listen: false).removeFromWishlist(book);
  }

  @override
  Widget build(BuildContext context) {
    var wishlistItems = Provider.of<BookData>(context).wishlistItems;
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'), // Set your desired title here
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back when back button is pressed
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(

        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),

            child: SearchBarWidget(), // Replace this with your SearchBar widget
          ),
          Expanded(
            child: wishlistItems.isEmpty
                ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/selling.png',
                    width: 150, // Adjust the width as needed
                    height: 150, // Adjust the height as needed
                  ),
                  Text("You haven't added anything to the wishlist yet"),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ShopScreen(wishlistItems: [],)));
                    },
                    child: Text("Go to Shop"),
                  ),
                ],
              ),
            ):ListView.builder(
              itemCount: wishlistItems.length,
              itemBuilder: (context, index) {
                Book book = wishlistItems[index];
                return ListTile(
                  leading: Image.network(book.thumbnailUrl.toString()),
                  title: Text(book.title.toString()),
                  subtitle: Text(book.author.toString()),
                  onTap: () {
                    // Navigate to the BookDetailsPage when an item is tapped
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookDetailsPage(
                          book: book,
                          wishlistItems: wishlistItems,
                        ),
                      ),
                    );
                  },
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      removeFromWishlist(context, book);
                    },
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
