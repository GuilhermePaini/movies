import 'package:flutter/material.dart';
import 'package:mamamamovies/controllers/movie_controller.dart';
import 'package:mamamamovies/models/movie_model.dart';

import 'movie_details.dart';

class Search extends StatefulWidget {
  Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final MovieController movieController = MovieController();

  String searchFieldValue = "";
  List<Movie> listMovie = [];

  Widget mountView() {
    if (listMovie.isNotEmpty) {
      List<Widget> list = [];

      for (Movie movie in listMovie) {
        list.add(GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: ((context) => MovieDetails(movie: movie)),
              ),
            );
          },
          child: Card(
            color: Color(0xFF384249),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              textColor: Colors.white,
              tileColor: Color(0xFF384249),
              leading: movie.posterPath != ""
                  ? Image(image: NetworkImage('https://image.tmdb.org/t/p/w92/' + movie.posterPath))
                  : Image.asset('resources/test.png'),
              title: Text(
                movie.originalTitle,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(movie.releaseDate != "" ? '${movie.releaseDate.substring(0, 4)}' : ''),
            ),
          ),
        ));
      }
      return ListView(children: list);
    }

    if (listMovie.isEmpty && searchFieldValue.length > 0) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('resources/cinema_2.png'),
            Padding(
                padding: const EdgeInsets.all(5.0),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                      text: "No results found for ",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    TextSpan(
                      text: searchFieldValue,
                      style: TextStyle(color: Colors.blueAccent, fontSize: 18),
                    ),
                  ]),
                )),
          ],
        ),
      );
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('resources/cinema.png'),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              "Search for your favorite titles here!",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          title: Text("Search"),
          backgroundColor: Colors.black,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(5.0)) //<-- SEE HERE
                        ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    hintText: 'Search',
                    filled: true,
                    fillColor: Color(0xFF384249),
                    hintStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                  onChanged: (text) async {
                    setState(() => searchFieldValue = text);
                    if (text.length > 3) {
                      var movies = await movieController.getMovieByQuery(text);
                      setState(() => listMovie = movies);
                    }

                    print('First text field: $text');
                  }),
              Expanded(child: mountView())
            ],
          ),
        ));
  }
}
