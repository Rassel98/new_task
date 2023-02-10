

import 'dart:convert';

List<VideoModel> videoModelFromJson(dynamic str) =>
    List<VideoModel>.from((str as List<dynamic>).map((x) => VideoModel.fromJson(x)));

class VideoModel {
  VideoModel({
    this.id,
    this.caption,
    this.videoUrl,
    this.createdAt,
  });

  int? id;
  String? caption;
  String? videoUrl;
  String? createdAt;

  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
    id: json["id"],
    caption: json["caption"],
    videoUrl: json["video_url"],
    createdAt: json["created_at"],
  );

}
