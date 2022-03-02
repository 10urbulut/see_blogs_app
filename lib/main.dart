import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';
import 'package:see_blogs_app/business/auth_manager.dart';
import 'package:see_blogs_app/named_routes.dart';
import 'package:see_blogs_app/screens/article_detail_screen.dart';
import 'package:see_blogs_app/screens/auth_screens/sign_in_screen.dart';
import 'package:see_blogs_app/screens/auth_screens/sign_up_screen.dart';
import 'package:see_blogs_app/screens/favorites_screen.dart';
import 'package:see_blogs_app/screens/home_screen.dart';
import 'package:see_blogs_app/screens/profile_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: _providers,
      child: MaterialApp(
        title: 'Blogs',
        home: ProfileScreen(),
        theme: _themeData(),
        // routes: _routes,initialRoute: NamedRoutes.SIGN_IN,
      ),
    );
  }

  Map<String, WidgetBuilder> get _routes {
    return {
      NamedRoutes.SIGN_IN: (BuildContext context) => SignInScreen(),
      NamedRoutes.SIGN_UP: (BuildContext context) => SignUpScreen(),
    };
  }

  ThemeData _themeData() {
    return ThemeData(
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontFamily: 'Roboto',
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      dividerColor: Colors.transparent,
      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Colors.black,
          onPrimary: Colors.black,
          secondary: Colors.amber,
          onSecondary: Colors.amber,
          error: Colors.red,
          onError: Colors.red,
          background: Colors.white,
          onBackground: Colors.blueGrey,
          surface: Colors.green,
          onSurface: Colors.green),
      scaffoldBackgroundColor: Colors.white,
      primaryIconTheme: const IconThemeData(
        color: Colors.black,
      ),
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      // colorScheme: ColorScheme.dark(),
    );
  }

  List<SingleChildWidget> get _providers {
    return [
      ChangeNotifierProvider(create: (context) => AuthManager()),
    ];
  }
}
