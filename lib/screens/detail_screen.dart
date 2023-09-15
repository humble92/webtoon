import 'package:flutter/material.dart';
import 'package:webtoon/models/webtoon_model.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    super.key,
    required this.webtoon,
  });
  final WebtoonModel webtoon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: Text(
          webtoon.title,
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
