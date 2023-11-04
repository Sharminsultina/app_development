import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_screens.dart';

class GalleryDetails extends StatelessWidget {
  final Gallery photo;
  const GalleryDetails({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Photo Details"),
      ),
      body: Column(
        children: [
          Image.network(photo.url),
          Text(photo.title),
          Text('ID: ${photo.id}'),
        ],
      ),
    );
  }
}