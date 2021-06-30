import 'package:doubanjiang_getx/common/entities/entities.dart';
import 'package:doubanjiang_getx/common/utils/utils.dart';
import 'package:doubanjiang_getx/common/values/values.dart';

class RecommendAPI {
  static Future<List<RecommendResponseEntity>> recommendList({
    required RecommendRequestEntity params,
    bool refresh = false,
    bool cacheDisk = false,
  }) async {
    var response = await HttpUtil().get(
      '/recommend',
      queryParameters: params.toJson(),
      refresh: refresh,
      cacheDisk: cacheDisk,
      cacheKey: STORAGE_RECOMMEND_INDEX_CACHE_KEY,
    );
    return response
        .map<RecommendResponseEntity>(
            (item) => RecommendResponseEntity.fromJson(item))
        .toList();
  }
}
