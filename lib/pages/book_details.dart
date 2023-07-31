import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:play_book/pages/library_screen.dart';
import 'package:play_book/pages/wishlist_screen.dart';
import 'package:play_book/widgets/alert.dart';
import 'package:provider/provider.dart';
import 'package:play_book/providers/bookData.dart';
import 'package:play_book/widgets/rating.dart';
import 'package:readmore/readmore.dart';
import 'package:play_book/model/book.dart';




class BookDetailsPage extends StatefulWidget {
  final Book book;
  final List<Book> wishlistItems; // Add this line to receive the wishlistItems list

  BookDetailsPage({Key? key, required this.book, required this.wishlistItems})
      : super(key: key);
  @override
  State<BookDetailsPage> createState() => _BookDetailsPageState();
}


class _BookDetailsPageState extends State<BookDetailsPage> {


  @override
  Widget build(BuildContext context) {
    var libraryDataProvider = Provider.of<BookData>(context);
    var wishlistDataProvider= Provider.of<BookData>(context);

    List<Book> wishlistItems = wishlistDataProvider.wishlistItems;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.465,
                  child: Stack(
                    children: <Widget>[
                      Image.network(
                        widget.book.thumbnailUrl.toString(),
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                      Positioned.fill(
                          child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                              child: Container()))
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    color: Colors.white,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.book.title.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 14.0),
                            child: Text(widget.book.author.toString()),
                          ),
                          Row(
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(right: 10.0),
                                child: SizedBox(width: 44, child: Rating()),
                              ),
                              Text("(52 Ratings)")
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            child: Text(
                              "Description",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          ReadMoreText(
                            widget.book.description.toString(),
                            trimLines: 2,
                            colorClickableText: Colors.red,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: 'Read more',
                            trimExpandedText: 'Show less',
                            moreStyle: const TextStyle(
                                overflow: TextOverflow.fade,
                                color: Colors.blue,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height * 0.2)
                        ],
                      ),
                    ),
                    // width: double.infinity,
                    // height: MediaQuery.of(context).size.height * 0.5,
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: FloatingActionButton(
                backgroundColor: Color(0xffFF415D),
                onPressed: () {
                  var wishlistDataProvider = Provider.of<BookData>(context, listen: false);
                  if (!wishlistDataProvider.wishlistItems.contains(widget.book)) {
                    wishlistDataProvider.addToWishlist(widget.book);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${widget.book.title} added to wishlist.')),
                    );
                  } else {
                    wishlistDataProvider.removeFromWishlist(widget.book);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${widget.book.title} removed from wishlist.')),
                    );
                  }

                },
                child: Icon(
                  wishlistItems.contains(widget.book) ? Icons.favorite : Icons.favorite_border,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.14),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          widget.book.thumbnailUrl.toString(),
                        ),
                        fit: BoxFit.cover),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(32)),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Color.fromARGB(115, 117, 117, 117),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Color.fromARGB(115, 117, 117, 117),
                    child: IconButton(
                      icon: Icon(
                        Icons.more_vert,
                        color: Colors.white,
                      ),
                      onPressed: () {

                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(26.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      showAlertDialog(context);
                    },
                    child: Padding(
                      padding: EdgeInsets.all(18),
                      child: Text('Start reading'),
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      if (!libraryDataProvider.libraryBooks.contains(widget.book)) {
                        libraryDataProvider.addToLibrary(widget.book);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('${widget.book.title} added to library.')),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('${widget.book.title} is already in the library.')),
                        );
                      }
                      Navigator.pushNamed(context, LibraryScreen.routeName as String);
                    },
                    child: Padding(
                      padding: EdgeInsets.all(18),
                      child: Text('View in Library'),
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
