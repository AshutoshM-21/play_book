import 'package:flutter/material.dart';
import 'package:play_book/utils/book_view.dart';

import 'package:play_book/model/book.dart';

class BookData with ChangeNotifier {
  String trending_url =
      "https://www.googleapis.com/books/v1/volumes?q=+subject:manga";
  String adventure_url =
      "https://www.googleapis.com/books/v1/volumes?q=+subject:adventure";
  String fantasy_url =
      "https://www.googleapis.com/books/v1/volumes?q=+subject:fantasy";
  String novel_url =
      "https://www.googleapis.com/books/v1/volumes?q=+subject:novel";
  String fiction_url =
      "https://www.googleapis.com/books/v1/volumes?q=+subject:fiction";

  List<Book> _trendingBooks = [];
  List<Book> _novels = [];
  List<Book> _adventure = [];
  List<Book> _fantasy = [];
  List<Book> _searchResults = [];
  List<Book> _wishlist = [];
  List<Book> _libraryBooks = [];


  List<Book> get trending {
    return [..._trendingBooks];
  }

  List<Book> get searchres {
    return [..._searchResults];
  }

  List<Book> get novels {
    return [..._novels];
  }

  List<Book> get adventure {
    return [..._adventure];
  }

  List<Book> get fantasy {
    return [..._fantasy];
  }



  List<Book> get wishlistItems => _wishlist;





  List<Book> get libraryBooks => _libraryBooks;

  void addTrending() async {
    List<Book> trendingBooks = await getBooksData(trending_url);
    _trendingBooks.addAll(trendingBooks);
    notifyListeners();
  }

  void addnovels() async {
    List<Book> novels = await getBooksData(novel_url);
    _novels.addAll(novels);
    notifyListeners();
  }

  void addadventure() async {
    List<Book> adventureBooks = await getBooksData(adventure_url);
    _adventure.addAll(adventureBooks);
    notifyListeners();
  }

  void addFantasy() async {
    List<Book> fantasyBooks = await getBooksData(fantasy_url);
    _fantasy.addAll(fantasyBooks);
    notifyListeners();
  }

  void addSearchres({required String query, required int indexNumber}) async {
    clearSearch();
    List<Book> searchRes = await getBooksData(
        'https://www.googleapis.com/books/v1/volumes?q=${query}&startIndex=$indexNumber');
    _searchResults.addAll(searchRes);
    notifyListeners();
  }

  void loadMore({required String query, required int indexNumber}) async {
    // clearSearch();
    List<Book> searchRes = await getBooksData(
        'https://www.googleapis.com/books/v1/volumes?q=${query}&startIndex=$indexNumber');
    _searchResults.addAll(searchRes);
    notifyListeners();
  }

  void clearSearch() {
    _searchResults.clear();
    notifyListeners();
  }
  void addToWishlist(Book book) {
    if (!_wishlist.contains(book)) {
      _wishlist.add(book);
      notifyListeners();
    }
  }

  void removeFromWishlist(Book book) {
    wishlistItems.remove(book);
    notifyListeners();
  }

  void addToLibrary(Book book) {
    if (!_libraryBooks.contains(book)) {
      _libraryBooks.add(book);
      notifyListeners();
    }
  }
}
