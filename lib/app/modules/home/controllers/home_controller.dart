import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:task_app/app/data/models/video_model.dart';
import 'package:task_app/app/data/providers/home_provider.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  RxBool isLoading = true.obs;

  final _videoList = <VideoModel>[].obs;
  List<VideoModel> get videoList => _videoList;

  @override
  void onInit() async{
    super.onInit();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [
         SystemUiOverlay.bottom,
        SystemUiOverlay.top,
      ],
    );
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.grey.withOpacity(0.80),
    ));
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xFF000000),
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarDividerColor: null,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ));
    await getAllVideoList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getAllVideoList() async {
    try {
      isLoading(true);
      var getResponse = await HomeProvider().getVideos();
      if (getResponse != [] || getResponse != null) {
        _videoList.addAll(getResponse);
        print(
            'get category listttttttttttttttttttttttttttttttt ${videoList[0].videoUrl}');
        isLoading(false);
      } else {

        isLoading(true);
      }
    }
    finally {
      isLoading(false);
    }
  }
}
