import 'package:book_app_ui/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';

class BookDetailScreen extends StatefulWidget {
  final Book book;
  const BookDetailScreen({super.key, required this.book});

  @override
  State<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          backgroundColor: Colors.white,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios, color: Colors.black, size: 25),
          ),
          actions: [
            Icon(Icons.file_upload, color: Colors.black, size: 25),
            SizedBox(width: 25),
            GestureDetector(
              onTap: () {},
              child: Icon(Icons.favorite, size: 25),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                      widget.book.cover,
                      fit: BoxFit.cover,
                      height: 260,
                      width: MediaQuery.of(context).size.width / 2.5,
                    ),
                    SizedBox(width: 10),

                    Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Text(
                            widget.book.title,
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: Colors.black54,
                            ),
                            softWrap: true,
                          ),
                        ),
                        const SizedBox(height: 15),

                        Row(
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundImage: NetworkImage(
                                widget.book.authorImg,
                              ),
                            ),

                            SizedBox(width: 15),

                            Text(
                              widget.book.author,
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 15),
                        Row(
                          children: [
                            StarRating(
                              rating: widget.book.rating,
                              size: 20,
                              color: Colors.amber,
                              borderColor: Colors.amber,
                              starCount: 5,
                            ),
                          ],
                        ),

                        // Padding(
                        //   padding: EdgeInsets.only(left: 40),
                        //   child: SizedBox(
                        //     height: 110,
                        //     width: MediaQuery.of(context).size.width / 1.5,
                        //     child: ListView(
                        //       scrollDirection: Axis.horizontal,
                        //       children: [
                        //         Container(
                        //           decoration: BoxDecoration(
                        //             borderRadius: BorderRadius.circular(20),
                        //             border: Border.all(
                        //               width: 2
                        //             ),
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
