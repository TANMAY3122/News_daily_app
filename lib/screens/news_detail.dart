import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/screens/home_screen.dart';
// ignore: unused_import
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

// import 'package:news_app/screens/detailed_view.dart';
// import 'package:url_launcher/url_launcher.dart';

class NewsDetail extends StatelessWidget {
  final Article article;

  const NewsDetail({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(0, 39, 52, 67),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        // leading: GestureDetector(
        //   onTap: () {
        //     Navigator.push(
        //         context, MaterialPageRoute(builder: (context) => const HomeScreen()));
        //   },
        //   child: const Icon(
        //     Icons.arrow_back_ios,
        //     color: Colors.white,
        //   ),
        // ),
        title: Text(
          "Detailed Article",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 24,
          ),
        ),
      ),
      body:
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ListView(
        children: [
          Card(
            elevation: 5.0,
            color: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Image.network(
              article.imgurl,
            ),
          ),
          Card(
            elevation: 0,
            color: Theme.of(context).colorScheme.surfaceVariant,
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    article.title,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text(
                    "Author :${article.author}",
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ),

                Card(
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          article.description,
                          style: GoogleFonts.poppins(
                            color: const Color.fromARGB(255, 54, 54, 54),
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                        subtitle: Text(
                          article.date,
                          style: GoogleFonts.poppins(
                            color: const Color.fromARGB(255, 54, 54, 54),
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          article.content,
                          style: GoogleFonts.poppins(
                            color: const Color.fromARGB(255, 54, 54, 54),
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                        subtitle: Text(
                          article.newsurl,
                          style: GoogleFonts.poppins(
                            color: Colors.lightBlueAccent,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                MaterialButton(
                  onPressed: () async => await launchUrlString(article.newsurl),
                  child: Card(
                    child: const SizedBox(
                      height: 50,
                      child: Center(
                        child: Text("Read More"),
                      ),
                    ),
                  ),
                )

                //
              ],
            ),
          ),
          // InkWell(
          //   onTap: ,
          //   child: Card(
          //     margin: const EdgeInsets.all(10),
          //     elevation: 0,
          //     color: Theme.of(context).colorScheme.surfaceVariant,
          //     child: const SizedBox(
          //       height: 50,
          //       child: Center(
          //         child: Text("Read More"),
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}

// _launchURL() async {
//   final Article article;
//   Uri url = Uri.parse(article.newsurl);
//   if (await launchUrl(url)) {
//     await launchUrl(url);
//   } else {
//     throw 'Could not launch $url';
//   }
// }
