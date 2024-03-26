class FeedItem {
  String imagePath;
  String contentPath;
  String hashtagPath;
  String datePath;
  bool isMarked;

  FeedItem({
    required this.imagePath,
    required this.contentPath,
    required this.hashtagPath,
    required this.datePath,
    this.isMarked = false,
  });
}
