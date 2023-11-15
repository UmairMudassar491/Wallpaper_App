import 'dart:convert';

import 'package:flutter/material.dart';
import '../data/data.dart';
import '../model/wallpaper_model.dart';
import '../widgets/widget.dart';
import 'package:http/http.dart' as http;

class Search extends StatefulWidget {
  final String searchQuery;

  const Search({super.key, required this.searchQuery});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchController = TextEditingController();
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
    getSearchWallpapers(widget.searchQuery);
    super.initState();
    searchController.text = widget.searchQuery;
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
          Container(
            decoration: BoxDecoration(
              color: const Color(0xfff5f8fd),
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            margin: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: searchController,
                    decoration: const InputDecoration(
                        hintText: "Search Wallpaper", border: InputBorder.none),
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      getSearchWallpapers(searchController.text);
                    },
                    child: const Icon(Icons.search))
              ],
            ),
          ),
          const SizedBox(height: 15),
          wallpapersList(wallpapers: wallpapers, context: context)
        ]),
      ),
    );
  }
}
