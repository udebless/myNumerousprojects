
import 'package:flutter/material.dart';
import 'package:myprojects/model/movie.dart';

class MovieDetailsThumbnails extends StatelessWidget {
  const MovieDetailsThumbnails({Key key, this.thumbnail}) : super(key: key);
  final String thumbnail;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 250,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage(thumbnail),
                fit: BoxFit.cover,
              )),
            ),
            Icon(
              Icons.play_circle_fill_outlined,
              size: 100,
              color: Colors.white,
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0x00f5f5f5), Color(0xfff5f5f5)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
          height: 80,
        ),
      ],
    );
  }
}

class MovieDetailsHeaderWitPoster extends StatelessWidget {
  const MovieDetailsHeaderWitPoster({Key key, this.movie}) : super(key: key);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          MoviePoster(poster: movie.images[1].toString()),
          SizedBox(width: 16),
          Expanded(child: MovieDetailsHeader(movie: movie))
        ],
      ),
    );
  }
}

class MoviePoster extends StatelessWidget {
  final poster;
  const MoviePoster({Key key, this.poster}) : super(key: key);

  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.all(Radius.circular(10));
    return Card(
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Container(
          width: MediaQuery.of(context).size.width / 4,
          height: 160,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(poster), fit: BoxFit.cover)),
        ),
      ),
    );
  }
}

class MovieDetailsHeader extends StatelessWidget {
  final Movie movie;
  const MovieDetailsHeader({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${movie.year}  ${movie.genre}'.toUpperCase(),
          style: TextStyle(fontWeight: FontWeight.w400, color: Colors.cyan),
        ),
        Text(
          movie.title,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 32),
        ),
        Text.rich(
          TextSpan(
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
            children: <TextSpan>[
              TextSpan(
                text: movie.plot,
              ),
              TextSpan(text: 'More...', style: TextStyle(color: Colors.indigo))
            ],
          ),
        )
      ],
    );
  }
}

class MovieDetailsCast extends StatelessWidget {
  final Movie movie;
  const MovieDetailsCast({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          MovieField(field: 'Cast:   ', value: movie.actors),
          MovieField(field: 'Directors:  ', value: movie.director),
        ],
      ),
    );
  }
}

class MovieField extends StatelessWidget {
  final String field;
  final String value;
  const MovieField({Key key, this.field, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(field,
            style: TextStyle(
                color: Colors.black38,
                fontSize: 12,
                fontWeight: FontWeight.w300)),
        Expanded(
            child: Text(
          value,
          style: TextStyle(
              color: Colors.black, fontSize: 12, fontWeight: FontWeight.w300),
        )),
      ],
    );
  }
}

class HorizontalLine extends StatelessWidget {
  final Movie movie;
  const HorizontalLine({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Container(
        height: 0.5,
        color: Colors.grey,
      ),
    );
  }
}

class MovieExtraPosters extends StatelessWidget {
  final List<String> posters;
  const MovieExtraPosters({Key key, this.posters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            'More Movies'.toUpperCase(),
            style: TextStyle(fontSize: 14, color: Colors.deepOrange),
          ),
        ),
        Container(
          height: 300,
          padding: EdgeInsets.symmetric(vertical: 16),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(
              width: 8,
            ),
            itemCount: posters.length,
            itemBuilder: (context, index) => ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Container(
                width: MediaQuery.of(context).size.width / 3,
                height: 160,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(posters[index]), fit: BoxFit.cover),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}