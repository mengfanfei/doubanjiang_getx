import 'package:doubanjiang_getx/common/entities/entities.dart';
import 'package:get/get.dart';

class HomeState {
  // index
  final _index = 1.obs;
  set index(value) => this._index.value = value;
  get index => this._index.value;

  // placeholder
  final _placeholder = ''.obs;
  set placeholder(value) => this._placeholder.value = value;
  get placeholder => this._placeholder.value;

  // page
  final _page = 1.obs;
  set page(value) => _page.value = value;
  get page => _page.value;

  // recommendList
  var _recommendList = Rx<List<RecommendResponseEntity>?>(null);
  set recommendList(value) => _recommendList.value = value;
  get recommendList => _recommendList.value;
}
