import 'package:flutter/material.dart';
import 'package:my_gallery/detail_screen.dart';
import 'package:my_gallery/gallery_data.dart';

class ImagePage extends StatelessWidget {
  // Konstruktor
  const ImagePage({super.key});

  // Methoden
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      children: buildImages(context),
    );
  }

  List<Widget> buildImages(BuildContext context) {
    List<Widget> myWidgets = [];

    for (GalleryItem galleryItem in galleryData) {
      myWidgets.add(
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DetailScreen(
                  galleryItem: galleryItem,
                ),
              ),
            );
          },
          child: Card(
            child: Column(
              children: [
                Expanded(
                  child: Hero(
                    tag: galleryItem.imagePath,
                    child: Image.asset(
                      galleryItem.imagePath,
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(galleryItem.imageTitle),
              ],
            ),
          ),
        ),
      );
    }

    return myWidgets;
  }
}
