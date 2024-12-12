class MovieModel {
  String? page;
 Results? results;

  MovieModel({
    required this.page,
    required this.results,
  });
  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(page: json['page'], 
    results: Results.fromJson(json['results']));
  }
}

class Results {
  String? backdrop;
  String? id;
  String? title;
  String? original_title;
  String? overview;
  String? poster_path;
  String? meadia_type;
  String? adult;
  String? original_language;
  String? popularity;
  String? release_date;
  String? vote_average;
  String? vote_count;

  Results({
    required this.adult,
    required this.backdrop,
    required this.id,
    required this.meadia_type,
    required this.original_language,
    required this.original_title,
    required this.overview,
    required this.popularity,
    required this.poster_path,
    required this.release_date,
    required this.title,
    required this.vote_average,
    required this.vote_count,
  });
  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
        adult: json['adult'],
        backdrop: json['backdrop_path'],
        id: json['id'],
        meadia_type: json['media_type'],
        original_language: json['original_language'],
        original_title: json['original_title'],
        overview: json['overview'],
        popularity: json['popularity'],
        poster_path: json['poster_path'],
        release_date: json['release_date'],
        title: json['title'],
        vote_average: json['vote_average'],
        vote_count: json['vote_count']);
  }
}
