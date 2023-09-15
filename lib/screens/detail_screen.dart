import 'package:flutter/material.dart';
import 'package:webtoon/models/webtoon_model.dart';
import 'package:webtoon/models/webtoon_detail_model.dart';
import 'package:webtoon/models/webtoon_episode_model.dart';
import 'package:webtoon/services/api_service.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    super.key,
    required this.webtoon,
  });
  final WebtoonModel webtoon;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late final Future<WebtoonDetailModel> webtoonDetail =
      ApiService.getToonById(widget.webtoon.id);
  late final Future<List<WebtoonEpisodeModel>> episodes =
      ApiService.getLatestEpisodesById(widget.webtoon.id);

  // @override
  // void initState() {
  //   webtoonDetail =
  //     ApiService.getToonById(widget.webtoon.id);
  //   episodes =
  //     ApiService.getLatestEpisodesById(widget.webtoon.id);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: Text(
          widget.webtoon.title,
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: widget.webtoon.id,
                child: Container(
                  width: 250,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 15,
                        offset: const Offset(10, 10),
                        color: Colors.black.withOpacity(0.3),
                      )
                    ],
                  ),
                  child: Image.network(widget.webtoon.thumb),
                ),
              ),
            ],
          ),
          FutureBuilder(
            future: webtoonDetail,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 45,
                    right: 45,
                    top: 25,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        snapshot.data!.about,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        '${snapshot.data!.genre} / ${snapshot.data!.age}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                );
              }
              return const Text("...");
            },
          )
        ],
      ),
    );
  }
}
