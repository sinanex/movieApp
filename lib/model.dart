class result {
  String? title;
  String? original;
  String? overview;
  String? posterpath;
  String? backdroppath;
  String? type;
  result({
    required this.backdroppath,
    required this.title,
    required this.original,
    required this.overview,
    required this.posterpath,
    required this.type,
  });
  factory result.fromJson(Map<String, dynamic> json) {
    return result(
      type: json['media_type'].toString(),
      backdroppath: json['backdrop_path'],
      title: json['title'],
      original: json['original_title'],
      overview: json['overview'],
      posterpath: json['poster_path'],
    );
  }
}
