import 'package:flutter/painting.dart';

class Shadows {
  /// 登录页logo阴影
  static const BoxShadow signLogoShadow = BoxShadow(
    color: Color.fromRGBO(27, 27, 29, 0.15),
    offset: Offset(0, 5),
    blurRadius: 10,
  );

  // 主要阴影
  static const BoxShadow primaryShadow = BoxShadow(
    color: Color.fromRGBO(27, 27, 29, 0.15),
    offset: Offset(0, 5),
    blurRadius: 10,
  );
}
