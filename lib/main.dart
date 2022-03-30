import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:see_blogs_app/constants/strings/title_strings.dart';
import 'package:see_blogs_app/core/helpers/in_theme_data.dart';
import 'package:see_blogs_app/core/helpers/provider_generator.dart';
import 'package:see_blogs_app/core/helpers/routes/named_routes.dart';
import 'package:see_blogs_app/core/helpers/routes/route_generator.dart';
import 'package:see_blogs_app/environment.dart';
import 'package:see_blogs_app/models/token_hive_model/token_hive_model.dart';

void main() async {
  await checkTokenIsExist();

  runApp(const SeeBlogsAppMain());
}

class SeeBlogsAppMain extends StatelessWidget {
  const SeeBlogsAppMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderGenerator.providers,
      child: MaterialApp(
        title: TitleStrings.BLOGS,
        theme: InThemeData.themeData,
        routes: RouteGenerator.routes,
        initialRoute: _initialRoute,
      ),
    );
  }
}

String get _initialRoute => NamedRoutes.PROFILE;

Future<void> checkTokenIsExist() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter('hive');
  Hive.registerAdapter(TokenHiveModelAdapter());
  var box = await Hive.openBox('token');
  Environment.token = box.get('jwt').toString();
}
