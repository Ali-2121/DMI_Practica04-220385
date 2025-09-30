import 'package:flutter/material.dart';
import 'package:widget_app_220385/domain/entitites/video_post.dart';

class DiscoverProvider extends ChangeNotifier {
  bool initialLoading = true;
  List<VideoPost> videos = [];

  Future<void> loadNextPage() async {
    notifyListeners();
  }
}
