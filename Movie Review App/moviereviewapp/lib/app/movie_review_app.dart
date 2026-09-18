import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../features/auth/presentation/screens/splash_screen.dart';
import '../features/shared/presentation/provider/bottom_nav_provider.dart';
import '../features/profile/presentation/provider/profile_provider.dart';
import '../features/Home/presentation/provider/home_provider.dart';
import '../features/wishlist/presentation/provider/wishlist_provider.dart';
import '../features/search/presentation/provider/search_provider.dart';
import '../features/movie_screen/presentation/provider/movie_detail_provider.dart';
import '../features/auth/presentation/provider/auth_provider.dart' as auth;
import 'app_routes.dart';
import 'app_theme.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => auth.AuthProvider()),
        ChangeNotifierProvider(create: (_) => BottomNavProvider()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => WishlistProvider()),
        ChangeNotifierProvider(create: (_) => SearchProvider()),
        ChangeNotifierProvider(create: (_) => MovieDetailProvider()),
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        initialRoute: SplashScreen.name,
        onGenerateRoute: AppRoutes.onGeneratedRoute,
        home: SplashScreen(),
      ),
    );
  }
}
