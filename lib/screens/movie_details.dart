import 'package:flutter/material.dart';
import 'package:themoviedbapp/models/movie_model.dart';

class MovieDetails extends StatelessWidget {
  MovieDetails({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          title: Text(movie.title),
          backgroundColor: Colors.black,
          elevation: 2,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image(
                        image: movie.posterPath != ""
                            ? NetworkImage('https://image.tmdb.org/t/p/w154/' + movie.posterPath)
                            : AssetImage('resources/test.png') as ImageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5.0, 0, 0, 0),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text(
                          movie.title,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.white),
                        ),
                        const Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
                        Text(
                          movie.originalTitle,
                          style: const TextStyle(fontSize: 14.0, color: Colors.white),
                        ),
                        const Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
                        RichText(
                            text: TextSpan(children: [
                          WidgetSpan(
                              child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                            child: Icon(Icons.calendar_month, size: 16, color: Colors.white),
                          )),
                          TextSpan(
                            text: movie.releaseDate != "" ? movie.releaseDate.substring(0, 4) : '',
                            style: const TextStyle(fontSize: 14.0, color: Colors.white),
                          ),
                        ])),
                        const Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
                        RichText(
                            text: TextSpan(children: [
                          WidgetSpan(
                              child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                            child: Icon(Icons.star, size: 16, color: Colors.blueAccent),
                          )),
                          TextSpan(
                            text: '${movie.voteAverage}',
                            style: const TextStyle(fontSize: 14.0, color: Colors.white),
                          ),
                        ]))
                      ]),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        movie.overview.length > 300 ? movie.overview.substring(0, 300) + '...' : movie.overview,
                        textAlign: TextAlign.justify,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
