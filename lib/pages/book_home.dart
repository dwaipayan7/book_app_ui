import 'package:book_app_ui/models/models.dart';
import 'package:book_app_ui/pages/book_detail_screen.dart';
import 'package:flutter/material.dart';

class BookHome extends StatelessWidget {
  const BookHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.all(20),
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Icon(Icons.book, size: 35, color: Colors.black),
                SizedBox(width: 15),
                Expanded(
                  child: Text("Book App", style: TextStyle(fontSize: 30)),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bestSeller(),
                SizedBox(height: 15),
                Text(
                  "Best Sellers",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),

                Divider(color: Colors.black54),
                SizedBox(height: 10),
              ],
            ),
          ),

          bookList(),

        ],
      ),
    );
  }

  Container bookList(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "New Book List",
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10),

          SizedBox(
            height: 320,
            child: ListView.builder(
              itemCount: booklist.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final book = booklist[index];
                final String bookName =
                book.title.length > 15
                    ? "${book.title.substring(0, 13)}..."
                    : book.title;
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => BookDetailScreen(book: book,)));
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Hero(
                            tag: book.cover,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                book.cover,
                                height: 240,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            bookName,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),

                          Text(
                            book.author,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black45,
                            ),
                          ),

                          Text(
                            "\$${book.price}",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black45,
                            ),
                          ),
                        ],
                      ),
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

  Widget bestSeller() {
    return SizedBox(
      height: 240,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: booklist.length,
        itemBuilder: (context, index) {
          final book = booklist[index];
          return book.seller
              ? GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BookDetailScreen(book: book,)));
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      book.showImage,
                      height: 250,
                      width: 350,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
              : SizedBox();
        },
      ),
    );
  }
}
