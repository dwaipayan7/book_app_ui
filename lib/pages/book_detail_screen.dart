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
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Container(
                  height: 110,
                  padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      moreInfo(
                        "https://cdn.vectorstock.com/i/thumb-large/93/62/psychology-icon-vector-15909362.jpg",
                        widget.book.genre,
                        "Genera",
                      ),
                      const SizedBox(width: 10),
                      moreInfo(
                        "https://cdn2.iconfinder.com/data/icons/translation-1/513/translation-translate-language-international-translating_2_copy_7-512.png",
                        widget.book.language,
                        "Language",
                      ),
                      const SizedBox(width: 10),
                      moreInfo(
                        "https://cdn-icons-png.flaticon.com/512/4994/4994482.png",
                        widget.book.age,
                        "Age",
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: 400,
                width: double.infinity,
                child: DefaultTabController(
                  length: 2,
                  child: Scaffold(
                    backgroundColor: Colors.white,
                    appBar: PreferredSize(
                      preferredSize: Size.fromHeight(50),
                      child: SafeArea(
                        child: Column(
                          children: [
                            Expanded(child: Container()),

                            TabBar(
                              labelPadding: EdgeInsets.only(bottom: 13),
                              indicatorColor: Colors.black,
                              unselectedLabelColor: Colors.black38,
                              dividerColor: Colors.black,
                              tabs: [Text("Info"), Text("Reviews")],
                            ),
                          ],
                        ),
                      ),
                    ),
                    body: TabBarView(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: ListView(
                            children: [
                              Text(
                                "Summary",
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1.3,
                                  height: 2,
                                ),
                              ),

                              Text(
                                widget.book.summary,
                                style: TextStyle(fontSize: 15),
                                softWrap: true,
                              ),
                            ],
                          ),
                        ),
                        Center(
                          child: Text("No Reviews Available", style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: Colors.black38,
                          ),),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget moreInfo(image, title, value) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 2),
      ),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Row(
        children: [
          Image.network(image, height: 50, width: 50, fit: BoxFit.cover),

          SizedBox(width: 15),
          Column(
            children: [
              Text(
                title,
                style: TextStyle(
                  letterSpacing: 1.5,
                  fontSize: 12,
                  color: Colors.black38,
                ),
              ),

              Text(
                value,
                style: TextStyle(
                  letterSpacing: 1.5,
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
