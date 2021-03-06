import 'package:flutter/material.dart';
import 'package:material_tile_match/view/tile_images.dart';
import 'package:material_tile_match/viewmodel/puzzle_viewmodel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tile Match',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: TileMatchScreen(title: 'Tile Match'),
    );
  }
}

class TileMatchScreen extends StatefulWidget {
  TileMatchScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _TileMatchScreenState createState() => _TileMatchScreenState();
}

class _TileMatchScreenState extends State<TileMatchScreen> {
  final _viewmodel = PuzzleViewModel();
  var _tickCount = 0;

  _TileMatchScreenState() {
    _viewmodel.newPuzzle(tileImages.length);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder<int>(
              stream: _viewmodel.tickStream,
              builder: (context, snapshot) => Text('${snapshot.data}')
            )
          ],
        ),
      ),
    );
  } //
}
