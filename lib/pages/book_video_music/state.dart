import 'package:get/get.dart';

class BookVideoMusicState {
  // title
  final _title = "".obs;
  set title(value) => this._title.value = value;
  get title => this._title.value;
}
