import 'package:app_stack/core/ui/widgets/widgets.dart';
import 'package:go_router/go_router.dart';

abstract class AppFeature {
  abstract final List<GoRoute> routes;
  abstract final AppMenuDrawerItem? drawerItem;
}
