import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter/material.dart';
import '../boottom_nav/bottom_nav.dart';
import '../content_library/article_card.dart';
import '../content_library/article.dart';
import '../content_library/library.dart';
import '../ui_utils/colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List<Article>?> f = ContentLibrary.fetchArticles();
  int itemWidth = 150;
  int itemHeight = 75;


  int getCount() {
    return (MediaQuery.of(context).size.width / 200).floor();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            // height: MediaQuery.of(context).size.height - 75,
            // width: MediaQuery.of(context).size.width,
            child: FutureBuilder(
              future: f,
              builder: (_, snapshot) {
                if(snapshot.connectionState == ConnectionState.done) {
                  List<Article> empty = [];
                  List<Article> articles = snapshot.data ?? empty;
                  print(snapshot.hasData);
                  print(articles.length);
                  return GridView.count(
                    childAspectRatio: (itemWidth / itemHeight),
                    // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //   crossAxisCount: getCount(),
                    // ),
                    crossAxisCount: getCount(),
                    padding: EdgeInsets.all(5),
                    children: articles.map((a) => ArticleCard(article: a)).toList(),
                  );
                  return ListView.builder(
                    itemCount: articles.length,
                    itemBuilder: (_, i) {
                      return ArticleCard(article: articles[i],);
                    },
                  );
                }
                else return Container();
              },
            )
          ),
        ));
  }
}
