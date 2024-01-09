class ChannelModel {
  var id ;
  var title = "title";
  var link = "link";
  var logo = "logo";
  var cat = "cat";
  var createdAt = "createdAt";
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
