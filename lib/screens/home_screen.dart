import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/screens/news_detail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Article> articles = [];

  @override
  void initState() {
    super.initState();
    fetchArticles();
  }

  Future<void> fetchArticles() async {
    const apikey = "56c7d607cf61403ea0b8ccdf0fe505d3";
    final response = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apikey=$apikey"));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      setState(() {
        articles = (jsonData['articles'] as List)
            .map((data) => Article.fromJson(data))
            .toList();
      });
    } else {
      throw Exception("Failed to get Article");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(0, 39, 52, 67),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Text(
          "News Daily",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 24,
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: articles.length,
          itemBuilder: (context, index) {
            var articals = articles[index];
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card(
                    elevation: 0,
                    color: Theme.of(context).colorScheme.surfaceVariant,
                    child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () {
                        debugPrint('Card tapped.');
                      },
                      child: ListTile(
                        title: Text(
                          articals.title,
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Text(
                          "Author : ${articals.author}",
                          style: GoogleFonts.poppins(
                            color: const Color.fromARGB(255, 51, 51, 51),
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                        // tileColor: Color.fromARGB(179, 153, 153, 153),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NewsDetail(
                                        article: articals,
                                      )));
                        },
                      ),
                    )),
              ],
            );
          }),
    );
  }
}

class Article {
  final String imgurl;
  final String title;
  final String author;
  final String content;
  final String newsurl;
  final String description;
  final String date;

  Article({
    required this.imgurl,
    required this.title,
    required this.author,
    required this.content,
    required this.newsurl,
    required this.description,
    required this.date,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      imgurl: json["urlToImage"] ?? "",
      title: json["title"] ?? "",
      author: json["author"] ?? "",
      content: json["content"] ?? "",
      newsurl: json["url"] ?? "url",
      description: json["description"] ?? "url",
      date: json["publishedAt"] ?? "",
    );
  }
}
