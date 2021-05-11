class Tile {
  final _imageIndex; //field
  TileState state;

  Tile(int imageIndex) //constructor
      : _imageIndex = imageIndex,
        state = TileState.hidden;

  int get imageIndex => _imageIndex; //getter

// TileState get state => _state;  //getter
// these setter and getters are extra the method is accessing the field directly, so we need to make the Title State public
// set state(TileState state) => _state = state;  //setter

}

enum TileState { hidden, selected, solved}