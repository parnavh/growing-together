import 'dart:ui';
import 'package:flutter/material.dart';

enum Tags {
  Sleep,
  Tips,
  Advice,
  Health,
  Inspiring,
  Experiences,
  WorkLifeBalance,
  Career,
  Finance,
  SelfCare,
  MentalHealth,
  LegalAdvice,
  Food,
  Excerise,
}

List<Tags> TagsfromJson(List<dynamic> t) {
  // print(t);
  return t.map((e) {
      return Tags.values.firstWhere((element) =>
      element.toString() == 'Tags.'+e.toString());}
  ).toList();
}

List<String> TagstoJson(List<Tags> tags) {
  return tags.map((e) => e.toString().substring(5)).toList();
}

String show(Tags tag) {
  return tag.toString().substring(5);
}

final Map<Tags, Color> TagColorMap =  {
  Tags.Sleep: Colors.blueAccent.withAlpha(50),
  Tags.Tips: Colors.green.withAlpha(50),
  Tags.Advice: Colors.pink.withAlpha(50),
  Tags.Health: Colors.purple.withAlpha(50),
  Tags.Inspiring: Colors.amber.withAlpha(50),
  Tags.Experiences: Colors.deepOrange.withAlpha(50),
  Tags.WorkLifeBalance: Colors.cyan.withAlpha(50),
  Tags.Career: Colors.lightGreen.withAlpha(50),
  Tags.Finance: Colors.teal.withAlpha(50),
  Tags.SelfCare: Colors.deepPurple.withAlpha(50),
  Tags.MentalHealth: Colors.yellow.withAlpha(50),
  Tags.LegalAdvice: Colors.black.withAlpha(50),
  Tags.Food: Colors.brown.withAlpha(50),
  Tags.Excerise: Colors.indigo.withAlpha(50),
};