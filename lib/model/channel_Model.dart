class ChannelModel {
  var id;
  String? title = "title";
  String? link = "link";
  String? logo = "logo";
  String? cat = "cat";
  String? createdAt = "createdAt";
  var fav =0;

  factory ChannelModel.fromMap(Map<String, dynamic> maps) {
    return ChannelModel(
      maps['id'],
      maps['title'],
      maps['link'],
      maps['logo'],
      maps['cat'],
      maps['createdAt'],
      maps['fav'],
      // Initialize other fields from the map
    );
  }

  ChannelModel(this.id, this.title, this.link, this.logo, this.cat,
      this.createdAt, this.fav);
}
