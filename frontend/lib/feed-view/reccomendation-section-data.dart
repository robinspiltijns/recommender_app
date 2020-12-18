enum ContentType { PODCAST, EPISODE, GENRE }

class RecommendationSectionData {

  final ContentType basis;
  final String id;
  final String description;
  dynamic recommendations;

  RecommendationSectionData({this.basis, this.id, this.description});

}