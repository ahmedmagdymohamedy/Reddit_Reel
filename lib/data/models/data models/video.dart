// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:reddit_task/data/models/data%20models/app_comment.dart';

class Video {
  String url;
  List<AppComment> comments;
  String publisherName;
  String title;
  String imageUrl;

  Video({
    required this.url,
    required this.comments,
    required this.publisherName,
    required this.title,
    required this.imageUrl,
  });
}
