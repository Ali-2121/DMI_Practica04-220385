import 'package:widgate_app_220472/domain/entities/video_post.dart';

class LocalVideoModel {
  final String name;
  final String videoUrl;
  final int likes;
  final int views;


  LocalVideoModel({

    required this.name,
    required this.videoUrl,
    this.likes=0,
    this.views=0
  }
  );


  factory LocalVideoModel.fromJs(Map<String,dynamic> json) => LocalVideoModel(
    name: json['name'] ?? 'none',
    videoUrl: json['videoUrl'] ?? 'not found url',
    likes: json['likes'] ?? 0,
    views: json['views'] ?? 0
  );/// Mapper te permite recorrer datos 

  VideoPost toVideoPostEntity()=> VideoPost(caption: name, videURL: videoUrl, likes: likes, views: views);
}