import 'package:api_marvel/controller/movie_controller.dart';
import 'package:api_marvel/model/model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {

  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final MovieController _controller = MovieController();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((value) {
      _controller.fetchMovies();
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text('CINEMARVEL'),
        backgroundColor: Colors.red,
        elevation: 5.5,
        bottom: PreferredSize(preferredSize: const Size.fromHeight(10.0), child: Container()),
      ),
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: ValueListenableBuilder<List<Movie>>(
            valueListenable: _controller.numberOfFilms,
            builder: (_, movies, __) => movies.isNotEmpty
                ? GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 18.0),
                    itemCount: movies.length,
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 2/3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (_, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: movies[index].coverUrl != null
                          ? CachedNetworkImage(
                              imageUrl: movies[index].coverUrl.toString(),
                              placeholderFadeInDuration: const Duration(seconds: 2),
                              placeholder: (_, url) => Image.asset('assets/images/marvel_logo.jpeg'))
                          : Image.asset('assets/images/marvel_logo.jpeg'),);
                    })
                : SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: const Center(child: CircularProgressIndicator(color: Colors.red,),),)
        )
      ),
    );
  }
}
