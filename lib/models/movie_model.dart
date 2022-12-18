// "backdrop_sizes": [
//   "w300",
//   "w780",
//   "w1280",
//   "original"
// ],
// "logo_sizes": [
//   "w45",
//   "w92",
//   "w154",
//   "w185",
//   "w300",
//   "w500",
//   "original"
// ],
// "poster_sizes": [
//   "w92",
//   "w154",
//   "w185",
//   "w342",
//   "w500",
//   "w780",
//   "original"
// ],
// "profile_sizes": [
//   "w45",
//   "w185",
//   "h632",
//   "original"
// ],
// "still_sizes": [
//   "w92",
//   "w185",
//   "w300",
//   "original"
// ]

class Movie {
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final String title;
  final double voteAverage;

  Movie(
      {required this.id,
      required this.originalLanguage,
      required this.originalTitle,
      required this.title,
      required this.overview,
      required this.posterPath,
      required this.releaseDate,
      required this.voteAverage});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'] as int,
      originalLanguage: json['original_language'] as String,
      originalTitle: json['original_title'] as String,
      title: json['title'] as String,
      overview: json['overview'] as String,
      posterPath: json['poster_path'] != null ? json['poster_path'] as String : "",
      releaseDate: json['release_date'] as String,
      voteAverage: json['vote_average'].toDouble() as double,
    );
  }
}
