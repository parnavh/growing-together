import 'package:flutter/cupertino.dart';
import 'article.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';

class ContentLibrary {
  static final String collectionArticle = 'Article';
  
  static final firestore = FirebaseFirestore.instance;

  static Future<List<Article>?> fetchArticles() async {
    QuerySnapshot snapshot = await firestore.collection(collectionArticle).get();
    print("# of articles ${snapshot.docs.length}");
    var articles = snapshot.docs.map((doc) {
      Map<String, dynamic> d = doc.data() as Map<String, dynamic>;
      // print("Map $d");
      Article a = Article.fromJson(d);
      // print("object ${a.toString()}");
      return a;
    }).toList();
    print(articles.length);
    return articles;
  }

  static Future<bool> uploadArticles(List<Article> arts) async {
    List<Map<String, dynamic>> data = arts.map((e) => e.toJson()).toList();

    print(data[0]);
    for(int i=0; i<data.length; i++) {
      firestore.collection(collectionArticle).add(data[i]).then((value) => debugPrint(value.id));
    }
    
    return true;
  }
}