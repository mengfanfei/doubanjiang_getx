import 'package:doubanjiang_getx/common/middlewares/middlewares.dart';
import 'package:doubanjiang_getx/pages/application/index.dart';
import 'package:doubanjiang_getx/pages/welcome/index.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.INITIAL;

  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.INITIAL,
      page: () => WelcomePage(),
      binding: WelcomeBinding(),
      middlewares: [
        RouteWelcomeMiddleware(priority: 1),
      ],
    ),
    GetPage(
      name: AppRoutes.Application,
      page: () => ApplicationPage(),
      binding: ApplicationBinding(),
    ),
  ];
}
