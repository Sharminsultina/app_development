import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:app_development/screens/gallery_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => HomeScreenUI();
}

class HomeScreenUI extends State<HomeScreen> {
  bool inProgress = false;
  List<Gallery> galleryList = [];

  Future<void> getImages() async {
    inProgress = true;
    setState(() {});

    Response response =
    await get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

    if (response.statusCode == 200) {
      List<dynamic> jsonObj = jsonDecode(response.body);

      for (Map<String, dynamic> toDartObj in jsonObj) {
        galleryList.add(Gallery(toDartObj['albumId'], toDartObj['id'],
            toDartObj['title'], toDartObj['url'], toDartObj['thumbnailUrl']));
      }
      inProgress = false;
      setState(() {});
    }
  }

  @override
  void initState() {
    getImages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Photo Gallery App"),
      ),
      body: inProgress
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: galleryList.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GalleryDetails(
                          photo: galleryList[index],
                        )));
              },
              leading: Image.network(galleryList[index].thumbnailUrl),
              title: Text(galleryList[index].title),
            ),
          );
        },
      ),
    );
  }
}

class Gallery {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Gallery(this.albumId, this.id, this.title, this.url, this.thumbnailUrl);
}