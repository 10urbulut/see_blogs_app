import 'package:flutter/material.dart';
import 'package:see_blogs_app/core/helpers/routes/named_routes.dart';
import 'package:see_blogs_app/screens/article_detail_screen.dart';
import 'package:see_blogs_app/screens/auth_screens/sign_in_screen.dart';
import 'package:see_blogs_app/screens/auth_screens/sign_up_screen.dart';
import 'package:see_blogs_app/screens/favorites_screen.dart';
import 'package:see_blogs_app/screens/home_screen.dart';
import 'package:see_blogs_app/screens/profile_screen/profile_screen.dart';

class RouteGenerator {
  static Map<String, WidgetBuilder> get routes {
    return {
      NamedRoutes.SIGN_IN: (BuildContext context) => SignInScreen(),
      NamedRoutes.SIGN_UP: (BuildContext context) => SignUpScreen(),
      NamedRoutes.ARTICLE_DETAIL: (BuildContext context) =>
          const ArticleDetailScreen(),
      NamedRoutes.FAVORITES: (BuildContext context) => FavoritesScreen(),
      NamedRoutes.HOME: (BuildContext context) => const HomeScreen(),
      NamedRoutes.PROFILE: (BuildContext context) => ProfileScreen(),
    };
  }
}
