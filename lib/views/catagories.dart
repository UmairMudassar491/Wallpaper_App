import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../data/data.dart';
import '../model/wallpaper_model.dart';
import '../widgets/widget.dart';

class Catagorie extends StatefulWidget {
  final String catagoriesName;
  const Catagorie({super.key, required this.catagoriesName});

  @override
  State<Catagorie> createState() => _CatagorieState();
}

class _CatagorieState extends State<Catagorie> {
  List<WallpaperModel> wallpapers = [];

  getSearchWallpapers(String qurey) async {
    var response = await http.get(
        Uri.parse(
            "https://api.pexels.com/v1/search?query=$qurey&per_page=15&page=1"),
        headers: {"Authorization": apiKey});

    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element) {
      WallpaperModel wallpaperModel = WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaperModel);
    });
    setState(() {});
  }

  @override
  void initState() {
    getSearchWallpapers(widget.catagoriesName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: appName(),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black87,
            )
            ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          const SizedBox(height: 15),
          wallpapersList(wallpapers: wallpapers, context: context)
        ]),
      ),
    );
  }
}
