import 'package:auto_route/auto_route.dart';
import 'package:task_manager/ui/login/login_page.dart';
import 'package:task_manager/ui/route/route_path.dart';
import 'package:task_manager/ui/top/top_page.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      path: RoutePath.appRouteTop,
      page: TopPage,
    ),
    AutoRoute(
      path: RoutePath.appRouteLogin,
      page: LoginPage,
    ),
  ],
)
class $AppRouter {}
