class BreakingNewsModel {
  final String? image;
  final String? header;
  final String? date;
  final String? name;
  final tag;

  BreakingNewsModel({
    this.image,
    this.header,
    this.date,
    this.name,
    this.tag,
  });
}

class NewsDetailModel{
 final title;
 final image;

 NewsDetailModel({this.title,this.image});
}