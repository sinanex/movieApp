class result {
  String? title;
  String? original;
  String? overview;
  String? posterpath;
  String? backdroppath;
  result({
    required this.backdroppath,
    required this.title,
    required this.original,
    required this.overview,
    required this.posterpath,
  });
  factory result.fromJson(Map<String, dynamic> json) {
    return result(
      backdroppath: json['backdrop_path'],
      title: json['title'],
      original: json['original_title'],
      overview: json['overview'],
      posterpath: json['poster_path'],
    );
  }
}
