import 'package:candi_uap/models/tile.dart';

class Array2d<T> {
  late List<List<T>> array;
  T defaultValue;
  late int _width;
  late int _height;

  Array2d(int width, int height, {required this.defaultValue}) {
    array = List<List<T>>();
    this.width = width;
    this.height = height;
  }

  operator [](int x) => array[x];

  set width(int v) {
    _width = v;
    while (array.length > v) array.removeLast();
    while (array.length < v) {
      List newList = List();
      if (array.length > 0) {
        for (int y = 0; y < array.first.length; y++) newList.add(defaultValue);
      }
      array.add(newList);
    }
  }

  set height(int v) {
    _height = v;
    while (array.first.length > v) {
      for (int x = 0; x < array.length; x++) array[x].removeLast();
    }
    while (array.first.length < v) {
      for (int x = 0; x < array.length; x++) array[x].add(defaultValue);
    }
  }

  int get width => _width;
  int get height => _height;

  //
  // Clone this Array2d
  //
  Array2d clone<T>(Tile tile){
    Array2d<T> newArray2d = Array2d<T>(_height, _width, defaultValue: null);

    for (int row = 0; row < _height; row++){
      for (int col = 0; col < _width; col++){
        newArray2d[row][col] = array[row][col];
      }
    }

    return newArray2d;
  }
}

String dumpArray2d(Array2d grid) {
  String string = "";
  for (int row = grid.height; row > 0; row--) {
    List<String> values = <String>[];
    for (int col = 0; col < grid.width; col++) {
      var cell = grid[row - 1][col];
      values.add(cell == null ? " " : cell.toString());
    }
    string += (values.join(" ") + "\n");
  }
  return string;
}
