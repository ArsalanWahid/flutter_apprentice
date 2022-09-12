import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../network/model/network_movie.dart';
import '../network/network_services/api_service.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Response? _response;
  NetworkMovie? _movie;

  @override
  Widget build(BuildContext context) {
    final _titleController = TextEditingController();
    final _yearController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text('Home screen')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
            child: TextField(
              controller: _titleController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Type movie title to search',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
            child: TextField(
              controller: _yearController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Type movie year if needed',
              ),
            ),
          ),
          RaisedButton(
            onPressed: () async {
              _response = await Provider.of<ApiService>(context, listen: false)
                  .getMovie(
                _titleController.text,
                _yearController.text,
              );
              _movie = NetworkMovie.fromJson(_response!.body);
              setState(() {});
            },
            child: Text('Search'),
          ),
          _movie != null
              ? _movie!.title != null
                  ? _movieDetails()
                  : Container()
              : Container(),
        ],
      ),
    );
  }

  Widget _movieDetails() {
    return Expanded(
      child: ListView(
        children: <Widget>[
          _buildText(_movie!.title, 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildText(_movie!.year, 16),
              _buildText(_movie!.runtime, 16),
              _buildText(_movie!.imdbRating, 16),
            ],
          ),
          Image.network(_movie!.poster, width: 400, height: 400),
          _buildText(_movie!.plot, 16),
          _buildText(_movie!.country, 14),
          _buildText(_movie!.director, 14),
          _buildText(_movie!.actors, 14),
          _buildText(_movie!.title, 14),
        ],
      ),
    );
  }

  Widget _buildText(String text, double fontSize) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: fontSize),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
