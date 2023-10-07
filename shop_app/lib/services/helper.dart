import 'package:flutter/services.dart' as the_bundle;
import 'package:shop_app/models/sneaker_model.dart';
import 'dart:convert';

class Helper {
  //Male
  Future<List<Sneakers>> getMaleSneakers() async {
    final data = await the_bundle.rootBundle.loadString(
        "assets/json/men_shoes.json");
    final List<Sneakers> maleList = List<Sneakers>.from(
        json.decode(data).map((x) => Sneakers.fromJson(x)));
    return maleList;
  }

  //Female
  Future<List<Sneakers>> getFeMaleSneakers() async {
    final data = await the_bundle.rootBundle.loadString(
        "assets/json/women_shoes.json");
    final List<Sneakers> femaleList = List<Sneakers>.from(
        json.decode(data).map((x) => Sneakers.fromJson(x)));
    return femaleList;
  }

  //Kids
  Future<List<Sneakers>> getKidsSneakers() async {
    final data = await the_bundle.rootBundle.loadString(
        "assets/json/kids_shoes.json");
    final List<Sneakers> kidsList = List<Sneakers>.from(
        json.decode(data).map((x) => Sneakers.fromJson(x)));
    return kidsList;
  }
}