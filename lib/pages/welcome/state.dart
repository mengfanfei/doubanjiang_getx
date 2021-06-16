import 'package:get/get.dart';

class WelcomeState {
  // title
  final _title = "1R".obs;
  set title(value) => this._title.value = value;
  get title => this._title.value;
}
