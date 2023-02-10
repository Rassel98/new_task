import 'package:get/get.dart';

import '../models/video_model.dart';

class HomeProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<List<VideoModel>> getVideos() async {
    // String url = AppUrl.getCourseVideosUrl;
    String url =
        'https://hajjmanagment.online/api/external/atab/m360ict/get/video/app/test';

    var response = await get(
      url,
    );

    if (response.statusCode == 200) {
      List<dynamic> modelList = response.body['data'];
      return videoModelFromJson(modelList);
    } else {
      return [];
    }
  }
}
