import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:see_blogs_app/business/auth_manager.dart';
import 'package:see_blogs_app/business/blog_manager.dart';
import 'package:see_blogs_app/business/general_manager.dart';

class ProviderGenerator {
  static List<SingleChildWidget> get providers => [
        ChangeNotifierProvider(create: (context) => LoginManager()),
        ChangeNotifierProvider(create: (context) => BlogManager()),
        ChangeNotifierProvider(create: (context) => GeneralManager()),
      ];
}
