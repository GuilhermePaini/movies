import 'package:flutter/material.dart';
import 'package:themoviedbapp/controllers/movie_controller.dart';

import '../models/movie_model.dart';
import 'movie_details.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final MovieController movieController = MovieController();
  List<Movie> trendings = [];
  List<Movie> upcomings = [];
  List<Movie> topRated = [];

  _HomeState() {
    movieController.getTrendings().then((value) => setState(() => trendings = value));
    movieController.getUpcoming().then((value) => setState(() => upcomings = value));
    movieController.getToprated().then((value) => setState(() => topRated = value));
  }

  List<Widget> getTrendings() => trendings
      .map((Movie mov) => MovieCard(
            movie: mov,
          ))
      .toList();

  List<Widget> getUpcoming() => upcomings
      .map((Movie mov) => MovieCard(
            movie: mov,
          ))
      .toList();

  List<Widget> getToprated() => topRated
      .map((Movie mov) => MovieCard(
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                    child: Text(
                      "Treding this week",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  Expanded(
                      child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: getTrendings(),
                  )),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                    child: Text(
                      "Upcoming",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  Expanded(
                      child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: getUpcoming(),
                  )),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                    child: Text(
                      "Top rated",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  Expanded(
                      child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: getToprated(),
                  )),
                ],
              ),
            )
          ],
        ));
  }
}

class MovieCard extends StatelessWidget {
  MovieCard({Key? key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: ((context) => MovieDetails(movie: movie)),
          ),
        );
      },
      child: Container(
          margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image(
              image: NetworkImage('https://image.tmdb.org/t/p/w154/' + movie.posterPath),
            ),
          )),
    );
  }
}
