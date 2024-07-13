// ignore_for_file: public_member_api_docs, sort_constructors_first
class AppComment {
  String image;
  String publisherName;
  String content;
  List<AppComment> replies;
  bool isRepliesShowen;
  int liksNumber;
  int disLiksNumber;
  int interactive; // 0 == no interactive // 1 = like // -1 = dislike
  DateTime createdAt;
  AppComment({
    required this.image,
    required this.publisherName,
    required this.content,
    required this.replies,
    required this.isRepliesShowen,
    required this.liksNumber,
    required this.disLiksNumber,
    required this.interactive,
    required this.createdAt,
  });
}
