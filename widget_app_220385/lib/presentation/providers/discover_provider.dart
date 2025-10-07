import 'package:flutter/material.dart';
import 'package:widget_app_220385/domain/entitites/video_post.dart';
import 'package:widget_app_220385/infrastructure/models/local_video_model.dart';
import 'package:widget_app_220385/shared/data/local_video_post.dart';


class DiscoverProvider extends ChangeNotifier { // Nos permite cambiar el estado de la aplicacion
  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider(){
    loadNextPage();
  }

  Future<void> loadNextPage() async {
    await Future.delayed(const Duration(seconds: 2));

    final List<VideoPost> newVideos = localVideoPosts
        .map((video) => LocalVideoModel.fromJs(video).toVideoPostEntity())
        .toList();
    
    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}