import 'package:flutter/material.dart';
import 'package:wallpaper_app/model/wallpaper_model.dart';

import '../views/image_view.dart';

Widget appName() {
  return RichText(
    text: const TextSpan(
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      children: <TextSpan>[
        TextSpan(
          text: 'Wallpapers',
          style: TextStyle(color: Colors.black87),
        ),
        TextSpan(
          text: ' App',
          style: TextStyle(color: Colors.blue),
        ),
      ],
    ),
  );
}

Widget wallpapersList({List<WallpaperModel>? wallpapers, context}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children: wallpapers!.map((wallpaper) {
        return GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ImageView(
                    imageUrl: wallpaper.src!.portrait!,
                  ),
                ),
              );
            },
            child: Hero(
              tag: wallpaper.src!.portrait!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  wallpaper.src!.portrait!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    ),
  );
}
