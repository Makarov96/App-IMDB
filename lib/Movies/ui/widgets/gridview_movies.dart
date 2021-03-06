import 'package:flutter/material.dart';
import 'package:movies/Movies/ui/widgets/exports.dart';


class GridViewMovies extends StatefulWidget {
  double _crossAxisSpacing = 15, _mainAxisSpacing = 12, _aspectRatio = 1;


  GridViewMovies({Key key}) : super(key: key);

  @override
  _GridViewMoviesState createState() => _GridViewMoviesState();
}

class _GridViewMoviesState extends State<GridViewMovies> {
  BlocMovies movieBloc;


  @override
  Widget build(BuildContext context) {
    movieBloc = BlocProvider.of(context);

    return FutureBuilder(
        future: movieBloc.getlistMovies(),
        builder: (BuildContext context, AsyncSnapshot<MoviesModel> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
              break;
            case ConnectionState.none:
              return Center(
                child: CircularProgressIndicator(),
              );
              break;

            case ConnectionState.done:
              if (snapshot.data == null) {
                return Center(child: Text("Intenta mas tarde"));
              }

              return Center(
                child: movieList(context, snapshot.data.items),
              );
              break;

            case ConnectionState.active:
              if (snapshot.data == null) {
                return Center(child: Text("Intenta mas tarde"));
              }
              return Center(
                child: movieList(context, snapshot.data.items),
              );

              break;
            default:
          }
        });
  }

  Widget movieList(context, List<Movie> listmovie) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double _pixeRatio = MediaQuery.of(context).devicePixelRatio;
    bool small = ResponsiveWidget.isScreenSmall(screenWidth, _pixeRatio);
    bool medium = ResponsiveWidget.isScreenMedium(screenWidth, _pixeRatio);
    bool large = ResponsiveWidget.isScreenLarge(screenWidth, _pixeRatio);

    return Container(
        margin: EdgeInsets.only(top: screenHeight * 0.2),
        child: GridView.builder(
            itemCount: listmovie.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: (large) ? 4 : (medium) ? 2 : (small) ? 2 : 2,
              crossAxisSpacing: widget._crossAxisSpacing,
              mainAxisSpacing: widget._mainAxisSpacing,
              childAspectRatio: (large)
                  ? screenWidth / (screenHeight / 0.62)
                  : (medium)
                      ? screenWidth / (screenHeight / 1.03)
                      : (small)
                          ? screenWidth / (screenHeight / 1.03)
                          : screenWidth / (screenHeight / 1.03),
            ),
            itemBuilder: (BuildContext context, int i) {
              
              final movie = listmovie[i];
      
              return FadeInLeft(
                duration: Duration(milliseconds: 10 * i),
                child: CardinfoMovies(
                    movie: Movie(
                        mediaType: movie.mediaType,
                        id: movie.id,
                        backdropPath: movie.backdropPath,
                        overview: movie.overview,
                        posterPath: movie.posterPath,
                        voteAverage: movie.voteAverage,
                        title: movie.title)),
              );
            }));
  }
}
