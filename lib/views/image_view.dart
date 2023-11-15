import 'package:flutter/material.dart';

class ImageView extends StatefulWidget {
  final String imageUrl;
  const ImageView({super.key, required this.imageUrl});

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Hero(
            tag: widget.imageUrl,
            child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  widget.imageUrl,
                  fit: BoxFit.cover,
                )),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white70, width: 1),
                    borderRadius: BorderRadius.circular(30),
                    gradient: const LinearGradient(colors: [
                      Color(0x36FFFFFF),
                      Color(0x0FFFFFFF),
                    ]),
                  ),
                  child: const Column(
                    children: <Widget>[
                      Text(
                        "Set Wallpaper",
                      ),
                      Text(
                        "Image will be save in gallery",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
                const Text(
                  "Cancel",
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  height: 50,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
