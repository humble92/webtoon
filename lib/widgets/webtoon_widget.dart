import 'package:flutter/material.dart';
import 'package:webtoon/models/webtoon_model.dart';

class Webtoon extends StatelessWidget {
  const Webtoon({
    super.key,
    required this.webtoon,
  });
  final WebtoonModel webtoon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("tabbed..");
      },
      child: Column(
        children: [
          Container(
            width: 250,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3,
                    offset: const Offset(10, 10),
                    color: Colors.black.withOpacity(0.5),
                  )
                ]),
            child: Image.network(
              webtoon.thumb,
              // "https://www.centerforbam.com/wp-content/uploads/2015/10/slide02.jpg",
              headers: const {
                'User-Agent':
                    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36 Edg/116.0.1938.76',
                'Referer': 'https://comic.naver.com',
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            webtoon.title,
            style: const TextStyle(fontSize: 22),
          ),
        ],
      ),
    );
  }
}
