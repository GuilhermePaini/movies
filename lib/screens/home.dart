import 'package:flutter/material.dart';
import 'package:mamamamovies/controllers/movie_controller.dart';

import '../models/movie_model.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final MovieController movieController = MovieController();
  List<Movie> trendings = [];

  _HomeState() {
    movieController.getTrendings().then((value) => setState(() => trendings = value));
  }

  List<Widget> getTrendings() => trendings
      .map((Movie mov) => TrendMovie(
            movie: mov,
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(
                    "Movies trending this week",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF63C5B7)),
                  ),
                  Expanded(
                      child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: getTrendings(),
                  )),
                  Text(
                    "Movies 123",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF63C5B7)),
                  ),
                  Expanded(
                      child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: getTrendings(),
                  )),
                  Text(
                    "Movies asdasdasdas",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF63C5B7)),
                  ),
                  Expanded(
                      child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: getTrendings(),
                  )),
                  // FutureBuilder(
                  //   future: movieController.getTrendings(),
                  //   builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  //     if (!snapshot.hasData) {
                  //       return const Center(
                  //         child: CircularProgressIndicator(),
                  //       );
                  //     }
                  //     List<Movie> movies = snapshot.data;
                  //     return ListView(
                  //       scrollDirection: Axis.horizontal,
                  //       children: movies
                  //           .map((Movie mov) => TrendMovie(
                  //                 movie: mov,
                  //               ))
                  //           .toList(),
                  //     );
                  //   },
                  // ),
                  // Expanded(
                  //   child: Spacer(),
                  // ),
                  // Expanded(
                  //   child: Spacer(),
                  // )
                ],
              ),
            )
          ],
        ));
  }
}

class TrendMovie extends StatelessWidget {
  TrendMovie({Key? key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 160.0,
        margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
        child: Image(
          image: NetworkImage('https://image.tmdb.org/t/p/w154/' + movie.posterPath),
        ));
  }
}
